#!/usr/bin/env groovy

pipeline {
    agent {
        docker {
            // image 'ultralytics/yolov5:latest'
            image 'hoangchieng282/mlops_image:v1'
            args '--ipc=host'
        }
    }
    // environment {
    //     // Copy the Jenkins build number of Suite-Build job into a global iPension environment variable
    //     // IPENSION_BUILD_NUMBER = "${env.BUILD_NUMBER}"

    // }

    stages {
        
        // stage('Suite - Build 22.3') {
        //     steps {
        //         script {
        //             // (default) parameters in order: branch, stageName, stageResult = false, SKIP_TEST = false, SKIP_DOCKER_PUSH_CH = true, SKIP_DOCKER_PUSH_VN = false, propagate = true
        //             STAGE_RESULT_SUITE_BUILD_RELEASE_22_3 = suiteBuild("ipension-suite-build-multibranch/release%2F22.3", "${STAGE_NAME}")
        //         }
        //     }
        // }
        
        stage('Starter') {
            steps {
                sh '''
                    python --version
                    python runs.py
                '''
                    // python runs.py
                
                // script {
                //     // (default) parameters in order: branch, stageName, stageResult = false, SKIP_TEST = false, SKIP_DOCKER_PUSH_CH = true, SKIP_DOCKER_PUSH_VN = false, propagate = true
                //     STAGE_RESULT_SUITE_BUILD_DEVELOP = suiteBuild("ipension-suite-build-multibranch/develop", "${STAGE_NAME}")
                // }
            }
        }
        stage('2nd') {
            steps {
                sh '''
                    python train.py --img 20 --batch 1 --epochs 1 --data nuti-competitor-products-5/data.yaml --weights yolov5l.pt
                '''
                // script {
                //     // (default) parameters in order: branch, stageName, stageResult = false, SKIP_TEST = false, SKIP_DOCKER_PUSH_CH = true, SKIP_DOCKER_PUSH_VN = false, propagate = true
                //     STAGE_RESULT_SUITE_BUILD_DEVELOP = suiteBuild("ipension-suite-build-multibranch/develop", "${STAGE_NAME}")
                // }
            }

        }


    }
}