##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "X-Forwarded-For" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-07
version "0.1"
description "This plugin extracts the proxy server details from the X-Forwarded-For param of the HTTP header. X-Forwarded-For is a non-standard header introduced by the developers of the Squid proxy before the Via header was added to HTTP."

# ShodanHQ results as at 2011-04-07 #
# 110 for X-Forwarded-For

# Examples #
examples %w|
174.129.12.43
216.166.72.16
195.56.146.188
85.112.162.200
221.130.6.171
221.130.6.183
93.92.134.35
67.202.195.116
|

# Passive #
def passive
	m=[]

	# Via HTTP header
	m << { :string=>@meta["x-forwarded-for"].to_s } unless @meta["x-forwarded-for"].nil?

	# Return passive matches
	m
end

end
