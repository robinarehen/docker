pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "MAVEN_HOME"
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/robinarehen/multi-modules'
            }
        }
        stage('Build') {
            steps {
                // -f: permite especificar el pom.xml que se debe ejecutar
                // para cuando una carpeta raíz contiene varios proyectos o módulos
                sh "mvn -DskipTests clean package -f micro-product/pom.xml"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test -f micro-product/pom.xml"
            }
        }
        stage('Sonar') {
            steps {
                sh "mvn sonar:sonar -Pcoverage -Dsonar.host.url=http://sonarqube:9000 -Dsonar.login=token -f micro-product/pom.xml"
            }
        }
        stage('Deploy') {
            steps {
                sh "mvn spring-boot:run -f micro-product/pom.xml"
            }
        }
    }
}

node {
   
    environment {
        projectOSE = '';
    }

    stage('Check branch') {
        try {       
            stageValidateExec(enviroment, branchGit);
            logEjecuciones = logEjecuciones + 'Check branch: OK\n';
        } catch(e) {
            logEjecuciones = logEjecuciones + 'Check branch: KO\n';
            throw e;
        }
    }

    stage('Tests Unitaries') {
        try {
            stageTests();
            logEjecuciones = logEjecuciones + 'Tests Unitaries PRO: OK\n';
        } catch (e) {
            logEjecuciones = logEjecuciones + 'Tests Unitaries PRO: KO\n';
            throw e;
        }
    }
}

def stageValidateExec(def env, def branch){ 
    if (env == "des" || (branch == "develop" || branch == "master" || branch.startsWith("release/"))) {
        println "Branch [${branch}] is valid to be deployed in [${env}]"
    } else {
        println "Branch [${branch}] is NOT valid to be deployed in [${env}]"
        throw new Exception("Invalid branch ${branch} for environment ${env}")
    }
}

def stageTests() {
    println 'Tests Unitarios PRO';
    try {
        withMaven(  jdk: 'JAVA_SYSTEM_11', maven: 'MAVEN_SYSTEM',mavenSettingsFilePath: '/opt/maven/conf/settingsPibank.xml') {
            if (isUnix()) {
                sh "mvn test";
            } else {
                bat "mvn test";
            }
        }
    } catch(err) {
        step([$class: 'JUnitResultArchiver', testResults: '**/target/surefire-reports/TEST-*.xml'])
        if (currentBuild.result == 'UNSTABLE') {
            currentBuild.result = 'FAILURE' //ABORTED FAILURE NOT_BUILT SUCCESS UNSTABLE
        }
        throw err;      
    }       
}
