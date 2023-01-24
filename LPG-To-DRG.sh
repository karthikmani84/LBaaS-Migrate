#!/bin/bash

echo "###UPDATE HUB VCN - CHECKPOINT PRIVATE SUBNET ROUTE TABLES#################"
oci network route-table update --rt-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaauo654sagogytoofvpgic5xsdohqrxfoc5vx24ovqv43n5tdq3vda --route-rules file://DC-MUM-HUB-PVT-RT-01.json --profile IFFCO-MUM --force >> Migration.txt

echo "###UPDATE HUB VCN - OCI NETWORK FIREWALL PRIVATE SUBNET ROUTE TABLES########"
oci network route-table update --rt-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaa336oytprbxbfgwuxggtl3qilkftihfg2at545vwt4l6xlhj5bteq --route-rules file://DC-MUM-HUB-NFWPVT-RT-01.json --profile IFFCO-MUM --force >> Migration.txt

echo "###UPDATE ROUTE-TABLE ASSOCIATED TO LPG : HUB-VCN to EBS-PROD-VCN###########"
oci network local-peering-gateway update --local-peering-gateway-id ocid1.localpeeringgateway.oc1.ap-mumbai-1.aaaaaaaa5n4wotecqp7myez2tz7zugywy46liluitxomat4y2jmmvg2x52ma --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaanwq73lz6es4lnldmwr6pgkwexjcn54mka7zidfrhd3dhj7dlbrpq --profile IFFCO-MUM --force >> Migration.txt

echo "###UPDATE HUB VCN - DRG TRANSIT ROUTE TABLES################################"
oci network route-table update --rt-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaayrfv6ju6nqbpthpoxizq5vdzh74zszqsljwa64vydmdxfw44rh3q --route-rules file://DC-MUM-DRG-ATTACHED-ROUTES.json --profile IFFCO-MUM --force >> Migration.txt

echo "###UPDATE DC-MUM-EBS-PROD-VCN SUBNETS ROUTE TABLES TO USE DRG###############"
oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaaoh6zjxej53atpx3cwtnmrgw6tvbwubecncqdquty7vjcuyixo4oq --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaawa3ymtaj5mqovq24olx5pb4rnmkc6hd4umhzlhcmc4uauwskqtoq --profile IFFCO-MUM --force >> Migration.txt

oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaasb6j7n27a7yw66mvdbnzgghdkvn2jzzcf6anjcdote67wvmytsza --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaawa3ymtaj5mqovq24olx5pb4rnmkc6hd4umhzlhcmc4uauwskqtoq --profile IFFCO-MUM --force >> Migration.txt

oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaa4zfcetklnktudfgjjss47pulyf52lxm6wdyxft67giynph7zu27q --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaawa3ymtaj5mqovq24olx5pb4rnmkc6hd4umhzlhcmc4uauwskqtoq --profile IFFCO-MUM --force >> Migration.txt

echo "###UPDATE DC-MUM-LGC-PROD-VCN SUBNETS ROUTE TABLES TO USE DRG###############"
oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaas2mykut5k4jl237ucx2l5bfafndph4y44xw3uvwvjp5x4ntsf2ea --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaavjirlzrqwgt6hlaeyokjgfblqe5dusowpyy3tix4oqpsiyoaakea --profile IFFCO-MUM --force >> Migration.txt

oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaa75auwdykpo534rvtt3ck65tnc6gqow3msadq37erjfdqvybtiosa --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaavjirlzrqwgt6hlaeyokjgfblqe5dusowpyy3tix4oqpsiyoaakea --profile IFFCO-MUM --force >> Migration.txt

echo "###UPDATE DC-MUM-MGMT-VCN SUBNETS ROUTE TABLES TO USE DRG###################"
oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaax5ggel42uu75fi7kvg35prmqvtpnsn37xr4hddprc6wogdw2ipdq --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaaxn6hzeds2mwe262pv4zzooko3um2y3fl4almcnbdr27fjvnfd6sq --profile IFFCO-MUM --force >> Migration.txt

oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaakso32ne3c37snz6c6bjnmaktxaciobxlvwaizgmmsh6af6fiou7q --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaalwdd6n7hau5igdxmq6olzdceeb246d6te52uz3w7lpreo3oed4pq --profile IFFCO-MUM --force >> Migration.txt

oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaangwu5es5ifta6sl4cfghq3zctnnerai4ow2zymfd6dkjg4fci4cq --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaalwdd6n7hau5igdxmq6olzdceeb246d6te52uz3w7lpreo3oed4pq --profile IFFCO-MUM --force >> Migration.txt

echo "###UPDATE MUM-DIGITAL-VCN SUBNETS ROUTE TABLES TO USE DRG####################"
oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaancplyfxbshpyrexxtktalvmfxvkcydvnqqyridzzu44akkslokfa --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaa7swgxcwxof7x44d2hkib4zx27dgvwkw6nowjziqcrbzri62xmgpq --profile IFFCO-MUM --force >> Migration.txt

oci network subnet update --subnet-id ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaa6qwmojqfgljxh7fzzfw4mbkpzoet7i5kedjt3beytu7gsuibpfaq --route-table-id ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaa7swgxcwxof7x44d2hkib4zx27dgvwkw6nowjziqcrbzri62xmgpq --profile IFFCO-MUM --force >> Migration.txt

echo "###LPG TO DRG MIGRATION COMPLETE , REVIEW MIGRATION LOGS#####################"
echo "###WITH THIS ALL VCNS, IPSEC & RPC CONNECTIONS ARE MOVED BEHIND OCI FIREWALL#"


