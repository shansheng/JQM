----机器猫-综合报表-持仓查询-产品持仓明细-历史：O32-信息查询-综合信息查询-组合证券[1]
--需要字段：日期，基金名称，组合名称，证券代码，证券名称，交易市场，持仓，冻结数量，外部评级，发行人外部评级，成本价，全价成本，全价市值，全价浮盈
select tt1.L_DATE, --日期
       tt1.L_FUND_ID, --基金序号
       tt1.vc_fund_code, --基金代码
       tt1.VC_FUND_NAME, --基金名称
       tt1.l_basecombi_id, --投资组合序号
       tt1.VC_COMBI_NO, --组合代码
       tt1.VC_COMBI_NAME, --组合名称
       tt1.vc_inter_code, --证券内码
       tt1.VC_REPORT_CODE, --证券代码
       tt1.VC_STOCK_NAME, --证券名称
       tt1.C_MARKET_NO, --交易市场代码
       tt1.vc_market_name, --交易市场名称
       tt1.L_CURRENT_AMOUNT, --持仓
       tt1.l_usable_amount, --可用数量
       tt1.L_FROZEN_AMOUNT, --冻结数量
       tt1.vc_outer_appraise_name        C_OUTER_APPRAISE, --外部评级
       tt1.vc_issuer_outer_appraise_name C_ISSUER_OUTER_APPRAISE, --发行人外部评级
       tt1.EN_BEGIN_COST_PRICE, --成本价
       tt1.EN_QJ, --全价
       tt1.EN_JJ, --净价
       tt1.en_dqcb                       d_dqcb, --当前成本
       tt1.en_lxcb                       d_lxcb, --利息成本
       tt1.en_qjcb                       d_qjcb, --全价成本
       tt1.VC_STOCKHOLDER_ID, --股东代码
       tt1.EN_LAST_PRICE, --最新价
       tt1.EN_VALUE_CURRENCY, --市值
       tt1.EN_FLOAT_RATE EN_TOTAL_PROFIT, --总体盈亏
       tt1.EN_TOTAL_PROFIT EN_CURRENCY_FUND, --市值比净值
       tt1.EN_CURRENCY_FUND EN_FLOAT_RATE, --盈亏率
       tt1.c_position_flag,  --持仓多空标志
       a.vc_item_name c_position_flag_cn  --持仓多空标志
       --tt1.en_jjsz                       d_jjsz, --净价市值【不准确】
       --tt1.en_qjsz                       d_qjsz, --全价市值【不准确】
       --tt1.en_jjfy                       d_jjfy, --净价浮盈【不准确】
       --tt1.en_qjfy                       d_qjfy --全价浮盈 --全价浮盈 = 全价市值 - 净价成本 - 利息成本【不准确】
  from stage.fm_thiscpccmx tt1
  left join 
  (select a.l_dictionary_no,a.c_lemma_item,a.vc_item_name
                  from stage.fm_tdictionary a
                 where a.l_dictionary_no = '40350'
                   and a.c_lemma_item <> '!') a
  on tt1.c_position_flag=a.c_lemma_item
 where 1 = 1