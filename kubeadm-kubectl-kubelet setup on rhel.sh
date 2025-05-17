#installing kubernetes on redhat based distribution:


               # Set SELinux in permissive mode (effectively disabling it)
                     sudo setenforce 0
                     sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config      
                                    
               # This overwrites any existing configuration in /etc/yum.repos.d/kubernetes.repo
                     cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
                           [kubernetes]
                           name=Kubernetes
                           baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
                           enabled=1
                           gpgcheck=1
                           gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
                           exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
                           EOF

               sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

               sudo systemctl enable --now kubelet
