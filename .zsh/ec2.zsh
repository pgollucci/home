p6=$HOME/.private/aws/p6
rc=$HOME/.private/aws/rc

if [ -e $p6 -o -e $rc ]; then
  export JAVA_HOME=/usr
  export EC2_HOME=$HOME/repos/aws/ec2-api-tools
  export EC2_URL=https://ec2.us-east-1.amazonaws.com
  export AWS_AUTO_SCALING_HOME=$HOME/repos/aws/ec2-autoscaling
  export PATH=$EC2_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$PATH
fi

function ec2l() {
	source $HOME/.private/aws/$1
}
