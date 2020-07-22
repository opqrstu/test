# .bashrc

export LD_LIBRARY_PATH=/home/donghyun.song/lib/
PATH=$PATH:$HOME/bin
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
branch_color ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        color=""
        if git diff --quiet 2>/dev/null >&2
        then
            color="\e[32m"
        else
            #color="\e[31m"
            color="\e[32m"
        fi
    else
        return 0
    fi
    echo -ne $color
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="[song@\h \W]\$(branch_color)\$(parse_git_branch)\e[m \$ "
export PS1="[song@\h \W]\[\033[32m\]\$(parse_git_branch)\[\033[m\] \$ "
#export PS1="[song@\h \W]\e[m \$ "
function my_function01(){
    DIRPATH=~/work/test/$(date +%Y)/$(date +%m)/$(date +%d)
    FIlENAME=test.c
if [ $# -ge 2 ]; then
    echo "파라미터 에러"
    return
fi
if [ $# -eq 1 ]; then
    FIlENAME=$1
fi

    if [ ! -d ${DIRPATH} ]; then
       mkdir -p ${DIRPATH};
    fi
    if [ ! -e ${DIRPATH}/${FIlENAME} ]; then
       cp ~/work/test/test.c ${DIRPATH}/${FIlENAME}
    fi
    
       vi ${DIRPATH}/${FIlENAME}
}
function my_function02()
{
if [ $# -ne 2 ]; then
    echo "파라미터 입력 필요"
    return
fi

if [ -f $1 ] && [ -f $2 ]; then
    echo "첫 번째 파라미터: $1"
    echo "두 번째 파라미터: $2"
else
    echo "파일을 찾을 수 없습니다."
    return
fi

if [ -f $1_old ]; then
    if [ -f $1_old_old ]; then
        echo "변환 실패"
        return
    else
        mv $1 $1_old_old                                                                                                                                                                       
        mv $2 $1
        mv $1_old_old $2
    fi
else
    mv $1 $1_old                                                                                                                                                                       
    mv $2 $1
    mv $1_old $2
fi

echo "변환 완료 : $1 <-> $2"
}

function my_function03()
{  
    local value=$1
    find . -name "*.o" | sed -e "s/\.o/\.c/g" | xargs -I{} grep -nHrs --color "${value}" {}
}
function my_function04()
{  
    local value=$1
    mv ${value} ${value}.backup
}
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias greps='grep -nHr --color -I --exclude "*.cmd" --exclude "tags" --exclude "cscope.out"'
alias cs='cscope -i cscope.files'
alias diff='colordiff' 
alias vit='my_function01'
alias vir='gcc ~/work/test/$(date +%Y)/$(date +%m)/$(date +%d)/test.c && ./a.out ;rm -rf ./a.out'
#alias rb='cd /home/donghyun.song/work/switch/EDFA/ramdisk/sources/ZebOS7_6_2/platform/nuevo/obj/; rm -f -r imi/imi_cmd.o imish/imish_cmd.o; cd -'
alias rb='cd /home/donghyun.song/work/switch/EDFA/ramdisk/sources/ZebOS7_6_2/platform/nuevo/obj/; rm -rf imi.a imish.a imi/imi_cmd.c imish/imish_cmd.c hwmond*; cd -'
alias cg='my_function02'
alias grepo='my_function03'
#alias grepc='find . -name "*.o" | sed -e "s/\.o/\.c/g" | xargs -I{} grep -nHrs --color "'\!^'" {}'
alias vii='vi; :vs 123;'
alias bac='my_function04'
