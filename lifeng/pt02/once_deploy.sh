#1/bin/sh
# used to create pipeline
# please make sure mysql and redis are ready

echo "please make sure mysql and redis are ready"
is="pt02"
basename="pt02"
cicd_project="cicd-tools"
dev_project="${basename}-dev"
pro_project="${basename}-pro"

# create project
oc new-project $dev_project
oc new-project $pro_project


# create pipeline in cicd project
oc project ${cicd_project}
oc apply -f bc_pipeline_${basename}.yaml

# create imagestream and bc,dc,svc,route in dev env
oc project $dev_project
oc create is $is
oc apply -f ${dev_project}.yaml

# create dc,svc,route in pro env
oc project $pro_project
oc apply -f ${pro_project}.yaml

# rbac settings
oc project $dev_project
oc adm policy add-role-to-user edit system:serviceaccount:cicd-tools:jenkins
oc project $pro_project
oc adm policy add-role-to-user edit system:serviceaccount:cicd-tools:jenkins

echo "please make sure mysql and redis are ready"
