# docker
Repositorio en el cual se agregan las diferentes imagenes a trabajar en diferentes carpetas, las cuales contienen un `docker-compose` y algunas el `Dockerfile` cuando es necesario crear una imagen propia.

<br>

# Sonarqube
Al momento de lanzar el contenedor va a solicitar usuario y clave los cuales por defecto son: `admin`, una vez ingresado solicita el cambio de la clave.

## Cobertura de código 
Para que se pueda reconocer la cobertura de test de los proyecto Java, se debe agregar el siguiente plugin al `pom.xml`.

En la url de [jacoco-maven-plugin](https://mvnrepository.com/artifact/org.jacoco/jacoco-maven-plugin) se puede consultar la versión más reciente.
```xml
			<plugin>
                <!-- https://mvnrepository.com/artifact/org.jacoco/jacoco-maven-plugin -->
				<groupId>org.jacoco</groupId>
				<artifactId>jacoco-maven-plugin</artifactId>
				<version>0.8.8</version>
				<executions>
					<execution>
						<id>prepare-agent</id>
						<goals>
							<goal>prepare-agent</goal>
						</goals>
					</execution>
					<execution>
						<id>report</id>
						<goals>
							<goal>report</goal>
						</goals>
						<configuration>
							<formats>
								<format>XML</format>
							</formats>
						</configuration>
					</execution>
				</executions>
			</plugin>
```

<br>

# Jenkins
Se plantena utilizar la api de github para la creación y administración de repositorio, para lo cual se accede a la documentación
[GitHub Api](https://docs.github.com/en/rest/repos).

Ejemplo:
```
curl --request POST --header "Authorization: token <githubtoken>" --data '{"name":"test-api","private":"false"}' --url "https://api.github.com/user/repos"
 
curl --request DELETE --header "Authorization: token <githubtoken>"  --url "https://api.github.com/repos/robinarehen/test-api"
```