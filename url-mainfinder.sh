!/bin/bash
#check if there is argument
if [ -z "$1" ]; then 
        echo "usage: $0 domain"
        exit 1
fi

#Running sublister
echo "[+] Running sublister....."

mkdir ~/Desktop/$1

echo"[+] directory created: Path = ~/Desktop/$1"


python3 sublist3r.py -d $1 -o ~/Desktop/$1/$1_sublister_urls.txt

#Running Subfinder
echo "[+] Running subfinder......"

subfinder -d $1 -o ~/Desktop/$1/$1_subfinder_urls.txt

cat ~/Desktop/$1/$1_sublister_urls.txt ~/Desktop/$1/$1_subfinder_urls.txt >> ~/Desktop/$1/all_subdomains.txt

#Running httpx to check accesebile domains.
httpx -l ~/Desktop/$1/all_subdomains.txt -threads 100 -timeout 15 -status-code -follow-redirects -title



