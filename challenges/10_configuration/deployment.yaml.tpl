apiVersion: apps/v1
kind: Deployment
metadata:
  name: config-server                                     # Deployment Name
spec:
  selector:
    matchLabels:
      app: config-server
  replicas: 1
  template:
    metadata:
      labels:
        app: config-server
    spec:
      volumes:
      - name: ???
        persistentVolumeClaim:
         claimName: ???
      - name: ???
        configMap:
          name: ???
      containers:
      - name: config-server
        image: europe-docker.pkg.dev/cw-k8s-training-playground/k8s-training/config-server:v1
        imagePullPolicy: Always
        ports:
        - name: http
          containerPort: 8080
          protocol: TCP
        livenessProbe:
          httpGet:
            path: /
            port: http
        readinessProbe:
          httpGet:
            path: /
            port: http
        env:
        - name: PORT
          value: "8080"
        - name: CONFIG_PATH
          value: /mnt/etc/config.toml
        - name: LOG_PATH
          value: /mnt/logs
        - name: KUBERNETES_POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: KUBERNETES_NODE_NAME
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName
        - name: ADMIN_PASSWORD
          valueFrom:
           secretKeyRef:
             name: admin-secret
             key: password
        volumeMounts:
        - name: ???
          mountPath: /mnt/logs
        - name: ???
          mountPath: /mnt/etc/config.toml
          subPath: ???
        resources:
          requests:
            cpu: "100m" 
          limits:
            cpu: "250m"
            memory: "250Mi"