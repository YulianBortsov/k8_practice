# Practical Kubernetes Training Drills

## Drill 1: Advanced Service Exposure
1. Deploy three versions of an application:
   - v1 with label app=myapp,version=v1
   - v2 with label app=myapp,version=v2
   - v3 with label app=myapp,version=v3
2. Create a main Service targeting all versions
3. Create a Service for each version individually
4. Set up an Ingress with following rules:
   - Path /v1/* goes to v1 service
   - Path /v2/* goes to v2 service
   - Path /v3/* goes to v3 service
   - All other paths load balance across all versions
5. Add TLS termination to the Ingress
6. Implement rate limiting of 100 requests per minute
7. Add custom response headers in the Ingress

## Drill 2: Storage Management
1. Create a custom StorageClass with:
   - Delayed volume binding
   - Allow volume expansion
   - Set specific reclaim policy
2. Create PVCs using this StorageClass
3. Deploy a StatefulSet running PostgreSQL with:
   - 3 replicas
   - Each pod gets 10Gi storage
   - Implement automatic backup using cron jobs
4. Perform a volume expansion from 10Gi to 15Gi
5. Simulate a node failure and verify data persistence
6. Implement pod disruption budget
7. Practice rolling updates without data loss

## Drill 3: Resource Management
1. Create namespace with resource quota:
   - Max 4 CPU cores
   - Max 8Gi memory
   - Max 10 pods
   - Max 5 persistent volume claims
2. Create LimitRange with:
   - Default request: 0.25 CPU, 256Mi memory
   - Default limit: 0.5 CPU, 512Mi memory
   - Max: 2 CPU, 2Gi memory
   - Min: 0.1 CPU, 64Mi memory
3. Deploy application and verify enforcement
4. Set up Horizontal Pod Autoscaling:
   - Min replicas: 2
   - Max replicas: 6
   - Target CPU utilization: 70%
5. Generate load and verify scaling
6. Monitor resource usage using metrics-server


## Drill 4: Multi-Container Patterns
1. Create a pod implementing the sidecar pattern:
   - Main container running nginx
   - Sidecar container updating content
   - Shared volume between containers
2. Create a pod implementing the ambassador pattern:
   - Main container connecting to localhost
   - Ambassador container proxying to external service
3. Create a pod implementing the adapter pattern:
   - Main container outputting logs
   - Adapter container transforming logs
4. Configure readiness/liveness probes for each container
5. Implement proper shutdown handling

## Drill 5: Secret Management
1. Create different types of secrets:
   - TLS secret for certificates
   - Docker registry credentials
   - Generic secret for application
2. Mount secrets in different ways:
   - As environment variables
   - As files
   - Using subPath
3. Implement secret rotation:
   - Create new secret version
   - Update pods without downtime
4. Set up proper RBAC for secret access
5. Implement external secret management (e.g., Vault)

## Drill 6: Advanced Scheduling
1. Label nodes with:
   - disk=ssd
   - environment=prod
   - compute=high
2. Create pods with node affinity:
   - Must run on SSD nodes
   - Prefer high-compute nodes
3. Implement pod affinity:
   - Co-locate cache pods with app pods
4. Configure pod anti-affinity:
   - No two instances on same node
   - Soft anti-affinity for less critical services
5. Use taints and tolerations:
   - Taint specific nodes
   - Add tolerations to pods
6. Test pod scheduling behavior



## Drill 7: Network Policy Implementation
1. Create three namespaces: frontend, backend, monitoring
2. Deploy sample apps in each namespace
3. Create Network Policies that:
   - Allow frontend to backend communication only on port 8080
   - Allow monitoring to scrape metrics from all namespaces
   - Deny all other ingress traffic
   - Allow egress only to internal cluster IPs
4. Test and verify policies using debug pods
5. Document any traffic that gets blocked
6. Implement logging for blocked connections



## Drill 8: Pod Security and Access Control
1. Create a new namespace called 'security-test'
2. Create a ServiceAccount called 'restricted-sa'
3. Create a Role that only allows:
   - Get, list, and watch operations on pods
   - Create and delete operations on deployments
   - No access to secrets or configmaps
4. Bind the Role to the ServiceAccount
5. Deploy a nginx pod using this ServiceAccount
6. Verify that the pod cannot create secrets
7. Modify the pod to run as non-root user (uid: 1000)
8. Add a securityContext that:
   - Makes the filesystem read-only
   - Prevents privilege escalation
   - Drops ALL capabilities
9. Verify the pod still runs correctly with these restrictions
