pipeline {
	agent { node { label 'linux' }  }
	environment {
  	 
   	PIPELINE_REPO = "https://github.com/imjoebond/netbox_dellos10_automation"
   	PIPELINE_BRANCH="main"
   	PIPELINE_WORKSPACE="network_auto"
   	//SSH_USER=credentials('ssh_user')
   	//#SSH_PASS=credentials('ssh_pass')
  	 
   }
	stages {

    	stage('checkout') {
        	steps {
            	echo "Pull from Git"
   		 	checkout poll: false,
           		 scm: [$class: 'GitSCM',
                 		 branches: [[name: "${PIPELINE_BRANCH}"]],
                 		 doGenerateSubmoduleConfigurations: false,
                 		 extensions: [[$class: 'ScmName', name: 'Pipeline'],
                              		 [$class: 'RelativeTargetDirectory', relativeTargetDir: "${PIPELINE_WORKSPACE}"],
                              		 [$class: 'CleanBeforeCheckout']],
                 		 submoduleCfg: [],
                 		 userRemoteConfigs: [[url: "${PIPELINE_REPO}"]]]
        	}
    	}  	 
    	stage('build') {
        	steps {
            	dir ('network_auto') {
                	sh('pip3 install -r requirements.txt --user')
            	}
        	}
    	}
	}
}
