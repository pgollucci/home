#!/bin/bash

# Copyright (C) 2009,2010,2013 pdfcrowd.com
# 
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

function usage() 
{
    echo "usage: pdfcrowd.sh source [options]

source can be one of:
 <uri>        uri to convert, e.g. http://example.com
 <filename>   path to a local file to convert
 -            convert html read from stdin
 @            show number of available conversion tokens

general options:
 -help             this screen
 -use-ssl          use secure connection
 -username         your username at pdfcrowd.com
 -key              your api key
 -no-config        do not read options from ~/.pdfcrowd
 -show-curl-cmd    write used curl command to stderr
 -host             api host (default: pdfcrowd.com)

conversion options:
 -out FILE         send PDF to FILE instead of stdout
 -width W          page width in points
 -height H         page height in points, -1 for a single page PDF
 -hmargin M        page horizontal margin in points
 -vmargin M        page vertical margin in points
 -margins T R B L  sets top, right, bottom and left page margins
 -footer-text      footer text, %u - source url
                                %p - the current page number
                                %n - total number of pages
 -footer-html HTM  place HTML code inside the footer
 -footer-url  URL  load and place HTML code inside the footer
 -header-html HTM  place HTML code inside the header
 -header-url  URL  load and place HTML code inside the header
 -no-hyperlinks    disable hyperlinks
 -encrypted        encrypted PDF
 -user-pwd PWD     protect PDF with user password PWD
 -owner-pwd PWD    protect PDF with owner password PWD
 -no-print         disable printing
 -no-modify        disable PDF modifications
 -no-copy          disable copying of text and images

 -page-layout N    initial page layout: 1-single page, 2-continuous,
                   3-continuous facing
 -page-mode N      initial page mode: 3-fullscreen
 -no-images        do not convert images
 -no-backgrounds   do not convert backgrounds
 -html-zoom        html zoom in percents
 -no-javascript    do not run JavaScript in web pages
 -text-encoding E  use E as the default text encoding if none is specified
 -use-print-media  use the print version of the page
 -max-pages N      convert at most N pages
 -pdfcrowd-logo    add the Pdfcrowd logo to the footer
 -pdf-zoom-type N  initial zoom: 1 - fit width
                                 2 - fit height
                                 3 - fit page
                                 4 - exact zoom (see -initial-pdf-zoom)
 -pdf-zoom Z       initial pdf zoom in percents
 -pdf-scaling-factor F     used to scale the PDF content
 -page-background-color C  the page background color in RRGGBB hex format

" >&2
}

function error
{
    echo $1 >&2
    exit 1
}


if [[ $@ != *-no-config* ]]; then
#
# read options from ~/.pdfcrowd and set them to the positional arguments
#
    if [ -r ~/.pdfcrowd ]; then
        exec 3<> ~/.pdfcrowd
        declare -a ARGS
        while read OPTION VALUE <&3
        do
            if [ -n "$OPTION" ]; then
                ARGS=( "${ARGS[@]}" "$OPTION" "$VALUE" )
            fi
        done
    fi
    SRC="$1"
    shift
    set -- "$SRC" "${ARGS[@]}" "$@"
fi


#
# env variables
#
# PDFCROWD_HOST
# 
if [ -z "$API_HOSTNAME" ]; then
    API_HOSTNAME=pdfcrowd.com
fi

if [ -z "$API_HTTP_PORT" ]; then
    API_HTTP_PORT=80
fi

if [ -z "$API_HTTPS_PORT" ]; then
    API_HTTPS_PORT=443
fi



#
# find out whether curl is available and set its default options
#
CURL=`which curl`
if [ -z "$CURL" ]; then
    error "please install curl"
fi

CURL_OPTS="--silent"
if [ "$API_HOSTNAME" != "pdfcrowd.com" ]; then
    CURL_OPTS="$CURL_OPTS --insecure"
fi


OPTS=
SCHEMA=http
PORT=$API_HTTP_PORT
API_URI_SUFFIX=
declare -a CONV_OPTS
SHOW_CURL_CMD=

#
# decode the source
# 
if [ -z "$1" ]; then
    echo "no conversion source specified, run with -help to get usage info" >&2
    exit 2
elif [ "$1" = "-help" ]; then
    usage
    exit 2
elif [ "$1" = "@" ]; then
    CMD_TOKENS=1
elif [ -e "$1" ] || [ "$1" = "-" ]; then
    if [ "$1" = "-" ]; then
        OPTS="$OPTS -F src=<-"
    else
        OPTS="$OPTS -F src=@$1"
    fi
    CMD_CONVERT=1
    API_URI_SUFFIX=html
elif [ "${1:0:4}" == "http" ]; then
    OPTS="$OPTS -F src=$1"
    CMD_CONVERT=1
    API_URI_SUFFIX=uri
else
    echo "invalid conversion source: $1" >&2
    exit 1
fi

shift

#
# parse the command line
# 
while true; do
    case "$1" in
        -use-ssl)
            SCHEMA=https
            PORT=$API_HTTPS_PORT
            shift
            ;;
        -host)
            API_HOSTNAME=$2
            shift 2
            ;;
        -username)
            API_USERNAME=$2
            shift 2
            ;;
        -key)
            API_TOKEN=$2
            shift 2
            ;;
        -out)
            OUT_FILE=$2
            shift 2
            ;;
        -width)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "width=$2" )
            shift 2
            ;;
        -height)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "height=$2" )
            shift 2
            ;;
        -hmargin)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "hmargin=$2" )
            shift 2
            ;;
        -vmargin)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "vmargin=$2" )
            shift 2
            ;;
        -margins)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "margin_top=$2" "-F" "margin_right=$3" "-F" "margin_bottom=$4" "-F" "margin_left=$5" )
            shift 5
            ;;
        -footer-text)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "footer_text=$2" )
            shift 2
            ;;
        -footer-html)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "footer_html=$2" )
            shift 2
            ;;
        -footer-url)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "footer_url=$2" )
            shift 2
            ;;
        -header-html)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "header_html=$2" )
            shift 2
            ;;
        -header-url)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "header_url=$2" )
            shift 2
            ;;
        -encrypted)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "encrypted=1" )
            shift 1
            ;;
        -user-pwd) 
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "user_pwd=$2" )
            shift 2
            ;;
        -owner-pwd)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "owner_pwd=$2" )
            shift 2
            ;;
        -no-print)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "no_print=1" )
            shift 1
            ;;
        -no-modify)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "no_modify=1" )
            shift 1
            ;;
        -no-copy)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "no_copy=1" )
            shift 1
            ;;
        -page-layout)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "page_layout=$2" )
            shift 2
            ;;
        -page-mode)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "page_mode=$2" )
            shift 2
            ;;
        -no-hyperlinks)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "no_hyperlinks=1" )
            shift 1
            ;;
        -no-images)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "no_images=1" )
            shift 1
            ;;
        -no-backgrounds)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "no_backgrounds=1" )
            shift 1
            ;;
        -html-zoom)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "html_zoom=$2" )
            shift 2
            ;;
        -no-javascript)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "no_javascript=1" )
            shift 1
            ;;
        -text-encoding)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "text_encoding=$2" )
            shift 2
            ;;
        -use-print-media)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "use_print_media=1" )
            shift 1
            ;;
        -max-pages)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "max_pages=$2" )
            shift 2
            ;;
        -pdfcrowd-logo)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "pdfcrowd_logo=1" )
            shift 1
            ;;
        -pdf-zoom-type)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "initial_pdf_zoom_type=$2" )
            shift 2
            ;;
        -pdf-zoom)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "initial_pdf_zoom=$2" )
            shift 2
            ;;
        -pdf-scaling-factor)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "pdf_scaling_factor=$2" )
            shift 2
            ;;
        -page-background-color)
            CONV_OPTS=( "${CONV_OPTS[@]}" "-F" "page_background_color=$2" )
            shift 2
            ;;
        -show-curl-cmd)
            SHOW_CURL_CMD=1
            shift
            ;;
        -no-config)
            # no-op, already processed
            shift
            ;;
        "")
            break
            ;;
        *)
            error "unknown argument $1"
            usage
            exit 2
            ;;
    esac
done


#
# verify that the mandatory options were specified
#
if [ -z "$CMD_CONVERT" ] && [ -z "$CMD_TOKENS" ]; then
    error "no command specified, run with -help"
fi

if [ -z "$API_USERNAME" ]; then
    error "username not specified"
fi

if [ -z "$API_TOKEN" ]; then
    error "api key not specified"
fi

OPTS="$OPTS -F username=$API_USERNAME -F key=$API_TOKEN"



#
# response body is redirected to a temporary file, its content is sent to
# specified destination only if the request succeeds
#
RESPONSE_FILE=/tmp/pdfcrowd.$$.pdf
trap 'rm -f $RESPONSE_FILE >/dev/null 2>&1' 0
trap "exit 2" 1 2 3 15


#
# prepare variables depending on whether it is a conversion or a query on
# available tokens
#
if [ -n "$CMD_CONVERT" ]; then
    API_URI=$SCHEMA://$API_HOSTNAME:$PORT/api/pdf/convert/$API_URI_SUFFIX/
    RESP_FMT="%{http_code}-%{content_type}"
    EXP_RESP_INFO="200-application/pdf"

else
    API_URI=$SCHEMA://$API_HOSTNAME:$PORT/api/user/$API_USERNAME/tokens/
    POST_CMD=echo  # newline after tokens
    RESP_FMT="%{http_code}"
    EXP_RESP_INFO="200"
fi


#
# call pdfcrowd service
#
if [ -n "$SHOW_CURL_CMD" ]; then
    echo $CURL $CURL_OPTS $OPTS "${CONV_OPTS[@]}" -w $RESP_FMT -o $RESPONSE_FILE  $API_URI >&2
fi

RESP_INFO=$($CURL $CURL_OPTS $OPTS "${CONV_OPTS[@]}" -w $RESP_FMT -o $RESPONSE_FILE  $API_URI)
if [ "$RESP_INFO" != "$EXP_RESP_INFO" ]; then
    echo ${RESP_INFO:0:3} >&2
    if [ -f $RESPONSE_FILE ]; then
        cat $RESPONSE_FILE >&2; echo >&2
    fi
    exit 1
fi

#
# send the result to its destination
#
if [ -n "$OUT_FILE" ]; then
    mv $RESPONSE_FILE $OUT_FILE
else
    cat $RESPONSE_FILE
    $POST_CMD
fi

