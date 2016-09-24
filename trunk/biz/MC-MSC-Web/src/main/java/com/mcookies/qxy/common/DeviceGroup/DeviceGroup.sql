CREATE TABLE device_group
(
    dgroup_id BIGINT(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组id',
    sid BIGINT(12) NOT NULL COMMENT '学校id',
    dgroup_name VARCHAR(50) NOT NULL COMMENT '分组名称',
    dgroup_explain VARCHAR(50) COMMENT '分组说明',
    is_use TINYINT(1) COMMENT '是否启用',
    create_time VARCHAR(24) COMMENT '创建时间',
    creator BIGINT(12) COMMENT '创建者',
    update_time VARCHAR(24) COMMENT '更新时间',
    updator BIGINT(12) COMMENT '最后更新者',
PRIMARY KEY (dgroup_id)
) COMMENT '设备分组表'
;