pipeline {
	agent { node { label 'linux' }  }
	environment {
  	 
   	PIPELINE_REPO = "https://github.com/imjoebond/netbox_dellos10_automation"
   	PIPELINE_BRANCH="jb_add_sonic"
   	PIPELINE_WORKSPACE="network_auto"
   	NETBOX_TOKEN=credentials('netbox_token')
    NETBOX_API="http://192.168.244.242:8000/"
   	
  	 
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
    	stage('install dependencies') {
        	steps {
            	dir ('network_auto') {
                	sh('pip3 install -r requirements.txt --user')
            	}
        	}
    	}
      stage('audit switches with ansible') {
        	steps {
            	dir ('network_auto') {
                	sh('ansible-playbook -i netbox_inventory -l leaf3 Pipelines/playbooks/check_switch_version.yaml -vvv')
            	}
        	}
    	}
	}
	}
}
