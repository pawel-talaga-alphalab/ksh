#!/bin/bash

target_node=$1
command=$2

k8s_ssh () {
        if [[ -z ${command} ]];
        then
                kubectl debug node/$target_node -it --image ubuntu:latest -- /bin/bash -c "chroot /host /bin/bash"
        else
                kubectl debug node/$target_node -it --image ubuntu:latest -- /bin/bash -c "chroot /host /bin/bash -c '$command'"
        fi
}

case "$target_node" in
        *.ap-east-1.* )
          kubectx eks-prod-hkg
          k8s_ssh
          ;;
        *.ap-southeast-1.* )
          kubectx eks-prod-sin
          k8s_ssh
          ;;
        *.ap-northeast-1.* )
          kubectx eks-prod-tyo
          k8s_ssh
          ;;
        *.ap-northeast-2.* )
          kubectx eks-prod-sel
          k8s_ssh
          ;;
        *.eu-central-1.* )
          kubectx eks-prod-fra
          k8s_ssh
          ;;
        *.eu-west-1.* )
          kubectx eks-prod-irl
          k8s_ssh
          ;;
        *.us-west-1.* )
          kubectx eks-prod-nca
          k8s_ssh
          ;;
        *.ec2.* )
          kubectx eks-prod-nva
          k8s_ssh
          ;;
        * )
        if [[ $target_node == *.node.al ]];
        then
            processed_target=$target_node
        else
            processed_target=$target_node.node.al
        fi

        if [[ -z ${command} ]];
        then
                ssh ec2-user@$processed_target
        else
                ssh ec2-user@$processed_target "$command"
        fi
          ;;
esac
