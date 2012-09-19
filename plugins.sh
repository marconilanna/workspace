#!/bin/bash

#######
# Shameless stolen from http://scala-ide.org/blog/director-script.html
#
# Additional information:
# https://github.com/scala-ide/scala-ide/blob/master/eclipse-director.sh
# http://help.eclipse.org/indigo/index.jsp?topic=/org.eclipse.platform.doc.isv/guide/p2_director.html

eclipse_dir="/Applications/Eclipse/"
eclipse_repo="http://download.eclipse.org/releases/indigo/"
scala_repo="http://download.scala-ide.org/releases-29/milestone/site/"
scala_ecosystem="http://download.scala-ide.org/ecosystem/dev-milestone-2.9/site/"

eclipse_opt="-nosplash"
app="org.eclipse.equinox.p2.director"

function usage()
{
    cat <<EOF
usage: `basename $0` [options] command

Options:
    --eclipse-dir <path>     Path to your Eclipse installation
                             Defaults to $eclipse_dir

    --eclipse-repo <url>     Eclipse repository URL
                             Defaults to $eclipse_repo

    --scala-repo <url>       Scala IDE repository URL
                             Defaults to $scala_repo

    --scala-ecosystem <url>  Scala Ecosystem repository URL
                             Defaults to $scala_ecosystem

Commands:
    list                     List available plugins

    install                  Install plugins

    help                     Print this help screen
EOF
    exit 1
}

function install()
{
    echo "Installing from:"
    echo " . $eclipse_repo"
    echo " . $scala_repo"
    echo " . $scala_ecosystem"
    echo
    $eclipse_dir/eclipse $eclipse_opt \
        -application $app \
        -repository $eclipse_repo,$scala_repo,$scala_ecosystem \
        -installIU \
org.eclipse.jdt.feature.group,\
org.eclipse.wst.jsdt.feature.feature.group,\
org.eclipse.wst.web_ui.feature.feature.group,\
org.eclipse.mylyn.ide_feature.feature.group,\
org.eclipse.egit.feature.group,\
org.scala-ide.sdt.feature.feature.group,\
org.scala-ide.sdt.scalatest.feature.feature.group,\
org.scalaide.worksheet.feature.feature.group
}

while [ $# -gt 0 ]; do

    case $1 in
        "" | "help")
            usage
            ;;

        "--eclipse-dir")
            eclipse_dir=$2
            echo "Eclipse installation dir is $eclipse_dir"
            shift 2
            ;;

        "--eclipse-repo")
            eclipse_repo=$2
            echo "Eclipse repository is $eclipse_repo"
            shift 2
            ;;

        "--scala-repo")
            scala_repo=$2
            echo "Scala IDE repository is $scala_repo"
            shift 2
            ;;

        "--scala-ecosystem")
            scala_ecosystem=$2
            echo "Scala Ecosystem repository is $scala_ecosystem"
            shift 2
            ;;

        "list")
            $eclipse_dir/eclipse $eclipse_opt \
                -application $app \
                -repository $eclipse_repo,$scala_repo,$scala_ecosystem \
                -list \
                | grep feature.group \
                | awk -F "=" '{print $1}'
            shift
            ;;

        "install")
            install
            shift
            ;;

        *)
            usage
            ;;
    esac
done
