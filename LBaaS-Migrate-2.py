import oci
import pandas as pd

# Load the config file
config = oci.config.from_file(profile_name="IFFCO-MUM")

# Read the data from the Excel file
data = pd.read_excel("/Users/karthikmani/Documents/Projects-Python/default/code/file.xlsx", sheet_name="Sheet1")

# Iterate over the rows of the data
for index, row in data.iterrows():
    if row['MULTIPLE'] == "No":
        listeners = {row['LISTENER_NAME']: {'defaultBackendSetName': row["BACKENDSET_NAME"],
                                       'port': row["LISTENER_PORT"],
                                       'protocol': 'TCP'}}
        backend_sets = {row["BACKENDSET_NAME"]: {'policy': "ROUND_ROBIN",
                                             'healthChecker': {
                                                 'protocol': 'TCP',
                                                 'port': row["LISTENER_PORT"],
                                                 'retries': 3,
                                                 'timeoutInMillis': 3000,
                                                 'intervalInMillis': 10000},
                                             'backends': [
                                                 {
                                                     'ipAddress': row["BACKEND_IP"],
                                                     'port': row["LISTENER_PORT"],
                                                     'weight': 1,
                                                     'backup': False,
                                                     'drain': False,
                                                     'offline': False}]}}
    else:
            listeners = {row['LISTENER_NAME']: {'defaultBackendSetName': row["BACKENDSET_NAME"],
                                       'port': row["LISTENER_PORT"],
                                       'protocol': 'TCP'},row['LISTENER_NAME_2']: {'defaultBackendSetName': row["BACKENDSET_NAME_2"],
                                       'port': row["LISTENER_PORT_2"],
                                       'protocol': 'TCP'}}
            backend_sets = {row["BACKENDSET_NAME"]: {'policy': "ROUND_ROBIN",
                                             'healthChecker': {
                                                 'protocol': 'TCP',
                                                 'port': row["LISTENER_PORT"],
                                                 'retries': 3,
                                                 'timeoutInMillis': 3000,
                                                 'intervalInMillis': 10000},
                                             'backends': [
                                                 {
                                                     'ipAddress': row["BACKEND_IP"],
                                                     'port': row["LISTENER_PORT"],
                                                     'weight': 1,
                                                     'backup': False,
                                                     'drain': False,
                                                     'offline': False}]},row["BACKENDSET_NAME_2"]: {'policy': "ROUND_ROBIN",
                                             'healthChecker': {
                                                 'protocol': 'TCP',
                                                 'port': row["LISTENER_PORT_2"],
                                                 'retries': 3,
                                                 'timeoutInMillis': 3000,
                                                 'intervalInMillis': 10000},
                                             'backends': [
                                                 {
                                                     'ipAddress': row["BACKEND_IP_2"],
                                                     'port': row["LISTENER_PORT_2"],
                                                     'weight': 1,
                                                     'backup': False,
                                                     'drain': False,
                                                     'offline': False}]}}
    reserved_ips = [ oci.load_balancer.models.ReservedIP(id=row["IP-OCID"])]
    # create a new load balancer
    lb = oci.load_balancer.LoadBalancerClient(config)
    # Create a new load balancer
    lb_details = oci.load_balancer.models.CreateLoadBalancerDetails(
        compartment_id=row["CMP-ID"],
        display_name=row["LB-NAME"],
        shape_details=oci.load_balancer.models.ShapeDetails(
            minimum_bandwidth_in_mbps=100,
            maximum_bandwidth_in_mbps=100),
        shape_name="flexible",
        is_private=False,
        subnet_ids= [row["SNET-ID"]],
        ip_mode="IPV4",
        reserved_ips=reserved_ips,
        listeners=listeners,
        backend_sets=backend_sets,
        network_security_group_ids=[row["NSG-OCID"]])
    # Get the data from response
    response = lb.create_load_balancer(lb_details)
    print(response.headers)