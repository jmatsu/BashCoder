head -1|grep -o "."|uniq -c|rev|tr \  \\n|rev|tr -d \ |tr -d \\n|grep -o ".*"