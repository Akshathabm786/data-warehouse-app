clear
sudo apt update && sudo apt install docker.io -y && sudo apt install docker-compose-v2 -y
clear
docker --version
docker compose version
git clone https://github.com/Akshathabm786/fork-Docker-Spring-Petclinic.git
ls
cd fork-Docker-Spring-Petclinic/
ls
ls -l
cat Dockerfile 
cat .env
cat docker-compose.yaml 
nano docker-compose.yaml 
clear
cat docker-compose.yaml 
clear
ls
docker images
sudo chmod 666 /var/run/docker.sock
docker images
docker ps
docker compose up -d
docker ps
docker images
clear
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 bash
clear
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 mysql -u root -p
nano .env
docker compose up -d
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 mysql -u root -p
clear
docker compose down
docker compose up -d 
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 mysql -u root -p
clear
docker logs --tail 200 fork-docker-spring-petclinic-spring-front-backend-1
docker exec fork-docker-spring-petclinic-spring-front-backend-1 printenv | grep -iE 'spring|datasource|mysql|database'
cd ~/fork-Docker-Spring-Petclinic
grep -RniE 'spring.datasource|jdbc:mysql|jdbc:h2|ddl-auto|SPRING_MYSQL_URL'   . --exclude-dir=.git --exclude-dir=target
cat docker-compose.yml
ls
cat docker-compose.yaml 
clear
ls 
rm docker-compose.yaml 
nano docker-compose.yaml
rm .env
nano .env
docker compose down
docker compose up -d
clear
docker logs --tail 100 fork-docker-spring-petclinic-spring-front-backend-1
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 mysql -u root -p
clear
docker images
docker ps -a
docker ps 
clear
docker logs --tail 100 fork-docker-spring-petclinic-spring-front-backend-1
cat .env
cat docker-compose.yaml 
clear
nano .env
nano docker-compose.yaml 
docker logs --tail 80 fork-docker-spring-petclinic-spring-mysql-db-1
docker compose down
clear
docker compose up -d
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 bash
clear
cat .env
cat docker-compose.yaml 
docker logs --tail 80 fork-docker-spring-petclinic-spring-front-backend-1
clear
rm docker-compose.yaml .env
nano docker-compose.yaml .env
nano docker-compose.yaml
docker compose config --quiet
docker compose up -d --build --force-recreate
docker ps
docker logs --tail 80 fork-docker-spring-petclinic-spring-front-backend-1
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 mysql -u root -p
clear
set -a
source .env
set +a
mkdir -p ~/petclinic_csv
for table in owners pets types vets specialties vet_specialties visits; do   echo "Exporting $table...";   docker exec -e MYSQL_PWD="$MYSQL_ROOT_PASSWORD"     fork-docker-spring-petclinic-spring-mysql-db-1     mysql -u root --batch --raw -D petclinic     -e "SELECT * FROM $table"     > ~/petclinic_csv/$table.tsv; done
clear
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 mysql -u root -p
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1
docker exec -it fork-docker-spring-petclinic-spring-mysql-db-1 bash
clear
cd ~/fork-Docker-Spring-Petclinic
set -a
source .env
set +a
ls
mkdir -p ~/petclinic_csv
ls
cd ..
ls
for table in owners pets types vets specialties vet_specialties visits; do   echo "Exporting $table...";    docker exec -e MYSQL_PWD="$MYSQL_ROOT_PASSWORD"     fork-docker-spring-petclinic-spring-mysql-db-1     mysql -u root --batch --raw -D petclinic     -e "SELECT * FROM $table"     > ~/petclinic_csv/$table.tsv; done
clear
ls
cd fork-Docker-Spring-Petclinic/
for table in owners pets types vets specialties vet_specialties visits; do   echo "Exporting $table...";    docker exec -e MYSQL_PWD="$MYSQL_ROOT_PASSWORD"     fork-docker-spring-petclinic-spring-mysql-db-1     mysql -u root --batch --raw -D petclinic     -e "SELECT * FROM $table"     > ~/petclinic_csv/$table.tsv; done
clear
set -a
source .env
set +a
if [ -n "$MYSQL_ROOT_PASSWORD" ]; then echo "Password loaded"; else echo "Password missing"; fi
docker exec -e MYSQL_PWD="$MYSQL_ROOT_PASSWORD" fork-docker-spring-petclinic-spring-mysql-db-1 mysql -u root -e "SHOW DATABASES;"
cd ~/fork-Docker-Spring-Petclinic
set -a
source .env
set +a
grep -E '^(MYSQL_USER|MYSQL_DATABASE|MYSQL_PASS|MYSQL_PASSWORD|MYSQL_ROOT_PASSWORD)=' .env | sed 's/=.*$/=<set>/'
docker exec -e MYSQL_PWD="$MYSQL_PASS" fork-docker-spring-petclinic-spring-mysql-db-1 mysql -u "$MYSQL_USER" -D petclinic -e "SHOW TABLES;"
clear
mkdir -p ~/petclinic_csv
for table in owners pets types vets specialties vet_specialties visits; do   echo "Exporting $table...";    docker exec -e MYSQL_PWD="$MYSQL_PASS"     fork-docker-spring-petclinic-spring-mysql-db-1     mysql -u "$MYSQL_USER" --batch --raw     -D petclinic -e "SELECT * FROM $table"     > ~/petclinic_csv/$table.tsv;  done
echo "Export completed!"
ls -lh ~/petclinic_csv/
head -5 ~/petclinic_csv/owners.tsv
clear
python3 - <<'PY'
import csv
import glob
import os

folder = os.path.expanduser("~/petclinic_csv")

for tsv_file in glob.glob(folder + "/*.tsv"):
    csv_file = tsv_file.replace(".tsv", ".csv")

    with open(tsv_file, "r", newline="", encoding="utf-8") as infile:
        reader = csv.reader(infile, delimiter="\t")

        with open(csv_file, "w", newline="", encoding="utf-8") as outfile:
            writer = csv.writer(outfile)
            writer.writerows(reader)

    print(f"Converted: {os.path.basename(csv_file)}")
PY

ls -lh ~/petclinic_csv/*.csv
cd ~
zip -r petclinic_csv.zip petclinic_csv
sudo apt install zip -y
zip -r petclinic_csv.zip petclinic_csv
ls
clear
lsb_release -a
lscpu
free -h
df -h
grep -m1 -oE 'sse4_2|popcnt' /proc/cpuinfo | sort -u
clear
TOKEN=$(curl -sX PUT "http://169.254.169.254/latest/api/token" \
-H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -sH "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-type
