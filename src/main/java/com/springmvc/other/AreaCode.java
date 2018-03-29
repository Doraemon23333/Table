package com.springmvc.other;

public class AreaCode {
    public String toCode(String chinese){
        if (chinese.equals("济南")){
            return "0531";
        }else if (chinese.equals("青岛")){
            return "0532";
        }else if (chinese.equals("淄博")){
            return "0533";
        }else if (chinese.equals("德州")){
            return "0534";
        }else if (chinese.equals("烟台")){
            return "0535";
        }else if (chinese.equals("潍坊")){
            return "0536";
        }else if (chinese.equals("济宁")){
            return "0537";
        }else if (chinese.equals("泰安")){
            return "0538";
        }else if (chinese.equals("临沂")){
            return "0539";
        }else if (chinese.equals("菏泽")){
            return "0530";
        }else if (chinese.equals("滨州")){
            return "0543";
        }else if (chinese.equals("东营")){
            return "0546";
        }else if (chinese.equals("威海")){
            return "0631";
        }else if (chinese.equals("枣庄")){
            return "0632";
        }else if (chinese.equals("日照")){
            return "0633";
        }else if (chinese.equals("莱芜")){
            return "0634";
        }else if (chinese.equals("聊城")){
            return "0635";
        }else return "fail";
    }

    public String toChinese(String code){
        if (code.equals("0531")){
            return "济南";
        }else if (code.equals("0532")){
            return "青岛";
        }else if (code.equals("0533")){
            return "淄博";
        }else if (code.equals("0534")){
            return "德州";
        }else if (code.equals("0535")){
            return "烟台";
        }else if (code.equals("0536")){
            return "潍坊";
        }else if (code.equals("0537")){
            return "济宁";
        }else if (code.equals("0538")){
            return "泰安";
        }else if (code.equals("0539")){
            return "临沂";
        }else if (code.equals("0530")){
            return "菏泽";
        }else if (code.equals("0543")){
            return "滨州";
        }else if (code.equals("0546")){
            return "东营";
        }else if (code.equals("0631")){
            return "威海";
        }else if (code.equals("0632")){
            return "枣庄";
        }else if (code.equals("0633")){
            return "日照";
        }else if (code.equals("0634")){
            return "莱芜";
        }else if (code.equals("0635")){
            return "聊城";
        }else return "fail";
    }

    public String enterpriseNatureToCode(String chinese){
        if (chinese.equals("国有企业")){
            return "gyqy";
        }else if (chinese.equals("集体企业")){
            return "jtqy";
        }else if (chinese.equals("联营企业")){
            return "lyqy";
        }else if (chinese.equals("股份合作制企业")){
            return "gfhzzqy";
        }else if (chinese.equals("私营企业")){
            return "syqy";
        }else if (chinese.equals("个体户")){
            return "gth";
        }else if (chinese.equals("合伙企业")){
            return "hzqy";
        }else if (chinese.equals("有限责任公司")){
            return "yxhzgs";
        }else return "fail";
    }

    public String codeToEnterpriseNature(String code){
        if (code.equals("gyqy")){
            return "国有企业";
        }else if (code.equals("jtqy")){
            return "集体企业";
        }else if (code.equals("lyqy")){
            return "联营企业";
        }else if (code.equals("gfhzzqy")){
            return "股份合作制企业";
        }else if (code.equals("syqy")){
            return "私营企业";
        }else if (code.equals("gth")){
            return "个体户";
        }else if (code.equals("hzqy")){
            return "合伙企业";
        }else if (code.equals("yxhzgs")){
            return "有限责任公司";
        }else return "fail";
    }

    public String industryToCode(String chinese){
        if (chinese.equals("制造业")){
            return "zzy";
        }else if (chinese.equals("服务业")){
            return "fwy";
        }else return "fail";
    }

    public String codiToIndustry(String code){
        if (code.equals("zzy")){
            return "制造业";
        }else if (code.equals("fwy")){
            return "服务业";
        }else return "fail";
    }

    public String checkYear(int year){
        String year1= String.valueOf(year);
        if (year1.length() < 4){
            for (; year1.length() < 4;){
                year1 = "0" + year1;
            }
        }
        return year1;
    }

    public String checkMonth(int month){
        String month1 = String.valueOf(month);
        if (month1.length() < 2){
            for (; month1.length() < 2;){
                month1 = "0" + month1;
            }
        }
        return month1;
    }

    public String checkDay(int day){
        String day1 = String.valueOf(day);
        if (day1.length() < 2){
            for (; day1.length() < 2;){
                day1 = "0" + day1;
            }
        }
        return day1;
    }
}
