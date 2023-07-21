def new_cl_client_context(client_name, enr, ip_addr, http_port_num, cl_nodes_metrics_info, beacon_service_name, validator_service_name = "", cl_min_cpu = "", cl_max_cpu = "", cl_min_memory = "", cl_max_memory = "", v_min_cpu = "", v_max_cpu = "", v_min_memory = "", v_max_memory = "", beacon_extra_params = [], validator_extra_params = []):
	return struct(
		client_name = client_name,
		enr = enr,
		ip_addr = ip_addr,
		http_port_num = http_port_num,
		cl_nodes_metrics_info = cl_nodes_metrics_info,
		beacon_service_name = beacon_service_name,
		validator_service_name = validator_service_name
	)
