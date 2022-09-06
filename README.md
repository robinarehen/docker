# docker
Repositorio en el cual se agregan las diferentes imagenes a trabajar en diferentes carpetas, las cuales contienen un `docker-compose` y algunas el `Dockerfile` cuando es necesario crear una imagen propia.

<br>


# Jenkins
Se instalan los siguientes plugins

1. **Role-based Authorization Strategy** para el manejo de los roles, [Documentación Oficial](https://plugins.jenkins.io/role-strategy/). Una vez instalado se deben seguir los siguientes pasos.

	1. Para habilitar el plugin se debe ir al apartado `~/Administrar Jenkins/Configuración global de la seguridad/Authentication/Autorización` donde se debe tomar la opción `Role Based Strategy`. 	

	2. Para agregar roles y permisos se debe ir al apartado `~/Administrar Jenkins/Manage and Assign Roles` y seguir las recomendaciones de la [Documentación Oficial](https://plugins.jenkins.io/role-strategy/).

<br>

2. **Maven** para compilar los proyectos, [Documentación oficial](https://plugins.jenkins.io/maven-plugin/). Una vez instalado el plugin se debe ir al apartado `~/Administrar Jenkins/Global tool configuration/Maven` y agregan una instalación con la versión que se desea trabajar.

<br>

3. **SonarQube** para el análisis de código, [Documentación oficial](https://plugins.jenkins.io/sonar/). Una vez instalado se deben seguir los siguientes pasos.
	
	1. Se debe lanzar el contenedor de [SonarQube](#sonarqube) y generar un **token**, en el apartado `~/Administration/Security/Users`, ejemplo: `e5b48b03ae6da8abf40bcacf406f065ffece8b8a`, una vez generado se debe copiar y guardar, ya que solo se muestra una sola vez.
	
	2. Siguiendo con la configuración en [SonarQube](#sonarqube) se debe ir al apartado `~/Administration/Configuration/webhooks` y agregar un nuevo `hook`, en el cual se agrega la url de **Jenkins** `http://jenkins:9080/sonarqube-webhook/`, el nombre es de libre elección.

	3. De vuelta en **Jenkins** , se debe crear una **Secret** con el **Token** generado en **SonarQube**, en el apartado `~/Administrar Jenkins/Manage Credential/Jenkins/Global Credentials/add Credential`, en el tipo o (`King`) según el idioma, se de seleccionar `Secret text` y llenar los campos, el valor del **Token** se debe ingresare en el campo `Secret`. 
	
	4. Siguiendo con la configuración en **Jenkins**, Para habilitar el plugin se debe ir al apartado `~/Administrar Jenkins/Configurar el Sistema/SonarQube servers` y agregar una instalación, en el cual se agrega la url de **Sonarqube** `http://sonarqube:9000`, el nombre es de libre elección y se debe seleccionar el **Secret** creado en el punto anterior el cual se muestra .

<br>

## Jenkins - GitHub
Se plantena utilizar la api de github para la creación y administración de repositorio, para lo cual se accede a la documentación
[GitHub Api](https://docs.github.com/en/rest/repos).

Ejemplo:
```
curl --request POST --header "Authorization: token <githubtoken>" --data '{"name":"test-api","private":"false"}' --url "https://api.github.com/user/repos"
 
curl --request DELETE --header "Authorization: token <githubtoken>"  --url "https://api.github.com/repos/robinarehen/test-api"
```

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