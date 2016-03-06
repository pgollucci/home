__setup() {
    
    autoload -U colors && colors

    zmods=(attr \
	       cap \
	       clone \
	       compctl \
	       complete \
	       complist \
	       computil \
	       curses \
	       datetime \
	       #	db/gdbm \ 
               deltochar \
	       #	example \
	       files \
	       langinfo \
	       mapfile \
	       mathfunc \
	       newuser \
	       parameter \
	       #	pcre \
	       #	param/private \
	       regex \
	       sched \
	       net/socket \
	       stat \
	       system \
               net/tcp \
               termcap \
	       terminfo \
	       zftp \
	       zle \
	       zleparameter \
	       zprof \
	       zpty \
	       zselect \
	       zutil \
	  )

    local zmod
    for zmod in $zmods; do
	zmodload zsh/$zmod
    done
}

__setup


	
	
