
# nginx.mirror.conf and nginx.nomirror.conf are the same except for the mirror config. Both are basicallyt stripped down nginx-orog.conf with all the shite stripped down.

# Tesing

# 1 run nginx
# windows commands
  # with the mirror config
docker run -it --rm -p 8811:80 -v %cd%/nginx.mirror.conf:/etc/nginx/conf.d/default.conf -v %cd%/index.html:/home/forge/sgtautotransport.com/public/index.html --name nginx-MIRROR nginx:latest
  # no mirror
docker run -it --rm -p 8811:80 -v %cd%/nginx.nomirror.conf:/etc/nginx/conf.d/default.conf -v %cd%/index.html:/home/forge/sgtautotransport.com/public/index.html --name nginx-NO-mirror nginx:latest

# unix commands
docker run -it --rm -p 8811:80 -v $PWD/nginx.mirror.conf:/etc/nginx/conf.d/default.conf -v $PWD/index.html:/home/forge/sgtautotransport.com/public/index.html --name nginx-MIRROR nginx:latest
docker run -it --rm -p 8811:80 -v $PWD/nginx.nomirror.conf:/etc/nginx/conf.d/default.conf -v $PWD/index.html:/home/forge/sgtautotransport.com/public/index.html --name nginx-NO-mirror nginx:latest

# 2 running a something to see mirrored trafic on the receiving side. In a separate terminal

python .\srv.py -p 9988 -a 0.0.0.0

nc -L -n -p 9988

# for windows -- https://raw.githubusercontent.com/int0x33/nc.exe/master/nc64.exe
nc64.exe -L -n -p 9988

# 3 make some test requests. again in a separate terminal
curl -X POST -i -H "Content-Type: application/json"  -d '{"hui":"deeba huiaaaaaa"}' 127.0.0.1:8811/api/uship/handle

# 4 static file test available. with a browser or curl
http://localhost:8811/index.html
