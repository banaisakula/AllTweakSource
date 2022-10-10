testall(){
        mv packages/*.deb /Users/lovez/Desktop/tmp
    cd $up_path
}
get_tmp(){
        rm -rf tmp.txt
    a=`ls -F |grep "/$" ` ;echo $a >> tmp.txt
    sed -i "" 's#/ #\
    #g' tmp.txt
    sed -i "" 's#/##g' tmp.txt
}


move(){
            echo "移动源码？"
        echo " y移动"
    read -n1 -p "Do you want to mv [Y/N]?" answer
        case $answer in
        Y | y)
        mv packages/*.deb /Users/lovez/Desktop/tmp
        mv  $path/$line /Users/lovez/Desktop/NoTodayView13bak;
        echo "yes"
        cd $up_path
    ;;
        *)
        echo "退出" 
        cd $up_path
        ;;
        esac
}


path=`pwd`;echo $path
get_tmp
for line in `cat ./tmp.txt`
do
pwd
    cd $path/$line
    rm -rf packages/*.deb
   mmm



testall

  ##  move



done
rm -rf tmp.txt