package com.springmvc.entity;

public class User {
    public int id;//用户id
    public int rank;//用户权限，1为企业，2为市，3为省
    public String usingCondition;//在线状况，online, unonline
    public String password;//密码
    public String account;//账户号码
    public int registerYear;//注册年
    public int registerMonth;//注册月
    public int registerDay;//注册日
    public int unregisterYear;//注销年
    public int unregisterMonth;//注销月
    public int unregisterDay;//注销日
    public String accompanyName;//用户名称
}
