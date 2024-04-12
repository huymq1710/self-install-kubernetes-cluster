# Step by step to deploy the kubernetes cluster

![k8s-dashboard.png](images%2Fk8s-dashboard.png)

This series of documents describes all the steps to deploy a `kubernetes v1.16.6` cluster using binary (Hard-Way mode).

During the deployment process, the startup parameters of each component, their meanings and possible problems will be listed in detail.

After the deployment is completed, you will understand the interaction principles of each component of the system and be able to quickly solve practical problems.

Therefore, this document is mainly suitable for those who have a certain foundation in kubernetes and want to learn and understand system configuration and operating principles through step-by-step deployment.

This series of documents is suitable for `CentOS 7` and above versions of the system. **Updated as each component is updated**. If you have any questions, please feel free to raise an issue!

Since strict security mechanisms such as `x509` certificate bidirectional authentication and `RBAC` authorization are enabled, it is recommended to **deploy from scratch**, otherwise authentication, authorization, etc. may fail!

Starting from version v1.16.x, this document has been adjusted as follows:
1. Container runtime: Use containerd to replace docker, which is simpler and more robust; the corresponding command line tool is crictl;
2. Pod network: Use calico to replace flannel to achieve Pod interoperability and support larger clusters;

New indicator monitoring system: Use mainstream Prometheus and Grafana technology stacks to implement cluster indicator collection and monitoring;

If you want to continue using docker and flannel, please refer to the attached documentation.

![grafana_dashboard.png](images%2Fgrafana_dashboard.png)

# Refs
- https://www.gitbook.com/download/pdf/book/opsnull/follow-me-install-kubernetes-cluster
