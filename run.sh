docker run -d -p 9090:9090 -v `readlink -f ./prometheus.yml`:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus
docker run -d -p 9100:9100 \
  -v "/proc:/host/proc:ro" \
  -v "/sys:/host/sys:ro" \
  -v "/:/rootfs:ro" \
  --net="host" \
  prom/node-exporter \
    --path.procfs /host/proc \
    --path.sysfs /host/sys \
    --collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
docker run -d -p 3000:3000 -e "GF_SECURITY_ADMIN_PASSWORD=password" -v ~/grafana_db:/var/lib/grafana grafana/grafana
