def new_participant(el_client_type, cl_client_type, el_client_context, cl_client_context, snooper_context=None):
	return struct(
		el_client_type = el_client_type,
		cl_client_type = cl_client_type,
		el_client_context = el_client_context,
		cl_client_context = cl_client_context,
		snooper_context = snooper_context,
	)
