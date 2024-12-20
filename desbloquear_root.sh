#!/bin/bash
echo "Creando archivo docker_setup.run..."
cat <<EOF > docker_setup.run
#!/bin/bash
echo "#############################################"
echo "#### PASO 1 DESCARGAR DOCKER ####"
echo "#############################################"
docker pull ubuntu:latest
docker run -dit --name container -v /:/mnt/root ubuntu
docker exec -dit container /bin/bash
echo "#############################################"
echo "#### PROCESO COMPLETADO ####"
echo "#############################################"
EOF
chmod +x docker_setup.run
echo "Archivo docker_setup.run creado y listo para ejecutarse."
echo "Ejecutando el script..."
./docker_setup.run
