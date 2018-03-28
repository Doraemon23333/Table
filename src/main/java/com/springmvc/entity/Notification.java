package com.springmvc.entity;

public class Notification {
    public int notification_id;//通知id
    public String title;//标题
    public String content;//内容
    public int type;//0为普通消息，1为数据审批消息
    public int publishYear;//年
    public int publishMonth;//月
    public int publishDay;//日
    public int id;//发布者id
    public int rank;//发布者等级
    public int receiverId;//发布者id
    public int receiverRank;//发布者等级
}
