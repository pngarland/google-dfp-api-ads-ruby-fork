# Encoding: utf-8
#
# This is auto-generated code, changes will be overwritten.
#
# Copyright:: Copyright 2012, Google Inc. All Rights Reserved.
# License:: Licensed under the Apache License, Version 2.0.
#
# Code generated by AdsCommon library 0.7.1 on 2012-06-05 17:33:45.

require 'adwords_api/errors'

module AdwordsApi; module V201109; module AdGroupService
  class AdGroupServiceRegistry
    ADGROUPSERVICE_METHODS = {:get=>{:input=>[{:name=>:service_selector, :type=>"Selector", :min_occurs=>0, :max_occurs=>1}], :output=>{:name=>"get_response", :fields=>[{:name=>:rval, :type=>"AdGroupPage", :min_occurs=>0, :max_occurs=>1}]}}, :mutate=>{:input=>[{:name=>:operations, :type=>"AdGroupOperation", :min_occurs=>0, :max_occurs=>:unbounded}], :output=>{:name=>"mutate_response", :fields=>[{:name=>:rval, :type=>"AdGroupReturnValue", :min_occurs=>0, :max_occurs=>1}]}}}
    ADGROUPSERVICE_TYPES = {:DateRange=>{:fields=>[{:name=>:min, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:max, :type=>"string", :min_occurs=>0, :max_occurs=>1}]}, :DoubleValue=>{:fields=>[{:name=>:number, :type=>"double", :min_occurs=>0, :max_occurs=>1}], :base=>"NumberValue"}, :EntityNotFound=>{:fields=>[{:name=>:reason, :type=>"EntityNotFound.Reason", :min_occurs=>0, :max_occurs=>1}], :base=>"ApiError"}, :LongValue=>{:fields=>[{:name=>:number, :type=>"long", :min_occurs=>0, :max_occurs=>1}], :base=>"NumberValue"}, :Money=>{:fields=>[{:name=>:micro_amount, :type=>"long", :min_occurs=>0, :max_occurs=>1}], :base=>"ComparableValue"}, :NumberValue=>{:fields=>[], :abstract=>true, :base=>"ComparableValue"}, :OperationAccessDenied=>{:fields=>[{:name=>:reason, :type=>"OperationAccessDenied.Reason", :min_occurs=>0, :max_occurs=>1}], :base=>"ApiError"}, :OrderBy=>{:fields=>[{:name=>:field, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:sort_order, :type=>"SortOrder", :min_occurs=>0, :max_occurs=>1}]}, :Paging=>{:fields=>[{:name=>:start_index, :type=>"int", :min_occurs=>0, :max_occurs=>1}, {:name=>:number_results, :type=>"int", :min_occurs=>0, :max_occurs=>1}]}, :PercentCPAAdGroupBids=>{:fields=>[{:name=>:percent_cpa, :type=>"int", :min_occurs=>0, :max_occurs=>1}], :base=>"AdGroupBids"}, :Predicate=>{:fields=>[{:name=>:field, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:operator, :type=>"Predicate.Operator", :min_occurs=>0, :max_occurs=>1}, {:name=>:values, :type=>"string", :min_occurs=>0, :max_occurs=>:unbounded}]}, :SoapHeader=>{:fields=>[{:name=>:auth_token, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:client_customer_id, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:developer_token, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:user_agent, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:validate_only, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}, {:name=>:partial_failure, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}]}, :SoapResponseHeader=>{:fields=>[{:name=>:request_id, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:service_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:method_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:operations, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:response_time, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:units, :type=>"long", :min_occurs=>0, :max_occurs=>1}]}, :ComparableValue=>{:fields=>[{:name=>:comparable_value_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}, :Selector=>{:fields=>[{:name=>:fields, :type=>"string", :min_occurs=>0, :max_occurs=>:unbounded}, {:name=>:predicates, :type=>"Predicate", :min_occurs=>0, :max_occurs=>:unbounded}, {:name=>:date_range, :type=>"DateRange", :min_occurs=>0, :max_occurs=>1}, {:name=>:ordering, :type=>"OrderBy", :min_occurs=>0, :max_occurs=>:unbounded}, {:name=>:paging, :type=>"Paging", :min_occurs=>0, :max_occurs=>1}]}, :Stats=>{:fields=>[{:name=>:start_date, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:end_date, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:network, :type=>"Stats.Network", :min_occurs=>0, :max_occurs=>1}, {:name=>:clicks, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:impressions, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:cost, :type=>"Money", :min_occurs=>0, :max_occurs=>1}, {:name=>:average_position, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:average_cpc, :type=>"Money", :min_occurs=>0, :max_occurs=>1}, {:name=>:average_cpm, :type=>"Money", :min_occurs=>0, :max_occurs=>1}, {:name=>:ctr, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:conversions, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:conversion_rate, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:cost_per_conversion, :type=>"Money", :min_occurs=>0, :max_occurs=>1}, {:name=>:conversions_many_per_click, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:conversion_rate_many_per_click, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:cost_per_conversion_many_per_click, :type=>"Money", :min_occurs=>0, :max_occurs=>1}, {:name=>:view_through_conversions, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:total_conv_value, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:value_per_conv, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:value_per_conv_many_per_click, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:invalid_clicks, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:invalid_click_rate, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:num_calls, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:num_missed_calls, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:num_received_calls, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:call_duration_secs, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:avg_call_duration_secs, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:stats_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}]}, :Bid=>{:fields=>[{:name=>:amount, :type=>"Money", :min_occurs=>0, :max_occurs=>1}]}, :BidMultiplier=>{:fields=>[{:name=>:multiplier, :type=>"double", :min_occurs=>0, :max_occurs=>1}, {:name=>:multiplied_bid, :type=>"Bid", :min_occurs=>0, :max_occurs=>1}]}, :BudgetOptimizerAdGroupBids=>{:fields=>[{:name=>:proxy_keyword_max_cpc, :type=>"Bid", :min_occurs=>0, :max_occurs=>1}, {:name=>:proxy_site_max_cpc, :type=>"Bid", :min_occurs=>0, :max_occurs=>1}, {:name=>:enhanced_cpc_enabled, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}], :base=>"AdGroupBids"}, :ConversionOptimizerAdGroupBids=>{:fields=>[{:name=>:target_cpa, :type=>"Bid", :min_occurs=>0, :max_occurs=>1}, {:name=>:conversion_optimizer_bid_type, :type=>"ConversionOptimizerBidType", :min_occurs=>0, :max_occurs=>1}, {:name=>:deduplication_mode, :type=>"ConversionDeduplicationMode", :min_occurs=>0, :max_occurs=>1}], :base=>"AdGroupBids"}, :ManualCPCAdGroupBids=>{:fields=>[{:name=>:keyword_max_cpc, :type=>"Bid", :min_occurs=>0, :max_occurs=>1}, {:name=>:keyword_content_max_cpc, :type=>"Bid", :min_occurs=>0, :max_occurs=>1}, {:name=>:site_max_cpc, :type=>"Bid", :min_occurs=>0, :max_occurs=>1}, {:name=>:enhanced_cpc_enabled, :type=>"boolean", :min_occurs=>0, :max_occurs=>1}], :base=>"AdGroupBids"}, :ManualCPCAdGroupExperimentBidMultipliers=>{:fields=>[{:name=>:max_cpc_multiplier, :type=>"BidMultiplier", :min_occurs=>0, :max_occurs=>1}, {:name=>:max_content_cpc_multiplier, :type=>"BidMultiplier", :min_occurs=>0, :max_occurs=>1}], :base=>"AdGroupExperimentBidMultipliers"}, :ManualCPMAdGroupBids=>{:fields=>[{:name=>:max_cpm, :type=>"Bid", :min_occurs=>0, :max_occurs=>1}], :base=>"AdGroupBids"}, :ManualCPMAdGroupExperimentBidMultipliers=>{:fields=>[{:name=>:max_cpm_multiplier, :type=>"BidMultiplier", :min_occurs=>0, :max_occurs=>1}], :base=>"AdGroupExperimentBidMultipliers"}, :AdGroupBids=>{:fields=>[{:name=>:ad_group_bids_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}, :AdGroupExperimentBidMultipliers=>{:fields=>[{:name=>:ad_group_experiment_bid_multipliers_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}, :AdGroupExperimentData=>{:fields=>[{:name=>:experiment_id, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:experiment_delta_status, :type=>"ExperimentDeltaStatus", :min_occurs=>0, :max_occurs=>1}, {:name=>:experiment_data_status, :type=>"ExperimentDataStatus", :min_occurs=>0, :max_occurs=>1}, {:name=>:experiment_bid_multipliers, :type=>"AdGroupExperimentBidMultipliers", :min_occurs=>0, :max_occurs=>1}]}, :AdGroup=>{:fields=>[{:name=>:id, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:campaign_id, :type=>"long", :min_occurs=>0, :max_occurs=>1}, {:name=>:campaign_name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:name, :type=>"string", :min_occurs=>0, :max_occurs=>1}, {:name=>:status, :type=>"AdGroup.Status", :min_occurs=>0, :max_occurs=>1}, {:name=>:bids, :type=>"AdGroupBids", :min_occurs=>0, :max_occurs=>1}, {:name=>:experiment_data, :type=>"AdGroupExperimentData", :min_occurs=>0, :max_occurs=>1}, {:name=>:stats, :type=>"Stats", :min_occurs=>0, :max_occurs=>1}]}, :AdGroupOperation=>{:fields=>[{:name=>:operand, :type=>"AdGroup", :min_occurs=>0, :max_occurs=>1}], :base=>"Operation"}, :AdGroupPage=>{:fields=>[{:name=>:entries, :type=>"AdGroup", :min_occurs=>0, :max_occurs=>:unbounded}], :base=>"Page"}, :AdGroupReturnValue=>{:fields=>[{:name=>:value, :type=>"AdGroup", :min_occurs=>0, :max_occurs=>:unbounded}], :base=>"ListReturnValue"}, :ListReturnValue=>{:fields=>[{:name=>:list_return_value_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}, :Operation=>{:fields=>[{:name=>:operator, :type=>"Operator", :min_occurs=>0, :max_occurs=>1}, {:name=>:operation_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}, :Page=>{:fields=>[{:name=>:total_num_entries, :type=>"int", :min_occurs=>0, :max_occurs=>1}, {:name=>:page_type, :type=>"string", :min_occurs=>0, :max_occurs=>1}], :abstract=>true}, :"AdGroup.Status"=>{:fields=>[]}, :ConversionDeduplicationMode=>{:fields=>[]}, :ConversionOptimizerBidType=>{:fields=>[]}, :ExperimentDataStatus=>{:fields=>[]}, :ExperimentDeltaStatus=>{:fields=>[]}, :Operator=>{:fields=>[]}, :"Predicate.Operator"=>{:fields=>[]}, :SortOrder=>{:fields=>[]}, :"Stats.Network"=>{:fields=>[]}}
    ADGROUPSERVICE_NAMESPACES = []

    def self.get_method_signature(method_name)
      return ADGROUPSERVICE_METHODS[method_name.to_sym]
    end

    def self.get_type_signature(type_name)
      return ADGROUPSERVICE_TYPES[type_name.to_sym]
    end

    def self.get_namespace(index)
      return ADGROUPSERVICE_NAMESPACES[index]
    end
  end

  # Base class for exceptions.
  class ApplicationException < AdwordsApi::Errors::ApiException
    attr_reader :message  # string
    attr_reader :application_exception_type  # string
  end

  # Exception class for holding a list of service errors.
  class ApiException < ApplicationException
    attr_reader :errors  # ApiError
    def initialize(exception_fault)
      @array_fields ||= []
      @array_fields << 'errors'
      super(exception_fault)
    end
  end
end; end; end
