package cn.libra.utils.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {

    public static final String ALLCHAR = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static final String LETTERCHAR = "abcdefghijkllmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    public static final String NUMBERCHAR = "0123456789";

    /**
     * 判断数字串是否为空或者零
     */
    public static boolean isEmpty(Integer num) {
        if (num == null || num == 0) {
            return true;
        }
        return false;
    }

    /**
     * 判断数字串是否不为空或者零
     */
    public static boolean isNotEmpty(Integer num) {

        return !isEmpty(num);
    }

    /**
     * 判断数字串是否为空或者零
     */
    public static boolean isEmpty(Float num) {
        if (num == null || num == 0) {
            return true;
        }
        return false;
    }

    /**
     * 判断数字串是否不为空或者零
     */
    public static boolean isNotEmpty(Float num) {

        return !isEmpty(num);
    }

    /**
     * 判断数字串是否为空 或者零
     */
    public static boolean isEmpty(Double num) {
        if (num == null || num == 0d) {
            return true;
        }
        return false;
    }

    /**
     * 判断数字串是否为不为空或者零
     */
    public static boolean isNotEmpty(Double num) {

        return !isEmpty(num);
    }

    /**
     * 判断Long类型是否空或者零
     */
    public static boolean isEmpty(Long strLong) {
        if (strLong == null || strLong == 0L || strLong.equals(0)) {
            return true;
        }
        return false;
    }

    /**
     * 判断Long类型是否不空或者零
     */
    public static boolean isNotEmpty(Long strLong) {

        return !isEmpty(strLong);
    }

    /**
     * 判断字符串是否为空
     */
    public static boolean isEmpty(String str) {
        if (str == null || str.length() <= 0 || str.trim() == null || str.trim().length() <= 0) {
            return true;
        }
        return false;
    }



    /**
     * 判断字符串是否不为空
     */
    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    /**
     * 判断列表是否为空
     */
    public static boolean isEmpty(List list) {
        if (list == null || list.size()==0) {
            return true;
        }
        return false;
    }

    /**
     * 判断列表是否不为空
     */
    public static boolean isNotEmpty(List list) {
        return !isEmpty(list);
    }
    /**
     * 生成时间戳
     * */
    public static String getTimeStamp() {
        Long time = new Date().getTime();
        return time.toString();
    }

    /*
    *
    * 生成不重复的id
    * */
    public static String get26id(){
        return getTimeStamp()+generateString(10);
    }

    /*
     *
     * 生成32位code
     * */
    public static String getCodeBy32(){
        return getTimeStamp()+generateString(16);
    }

    /**
     * 返回一个定长的随机字符串(只包含大小写字母、数字)
     *
     * @param length 随机字符串长度
     * @return 随机字符串
     */
    public static String generateString(int length) {
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(ALLCHAR.charAt(random.nextInt(ALLCHAR.length())));
        }
        return sb.toString();
    }

    /**
     * 返回一个定长的随机纯字母字符串(只包含大小写字母)
     *
     * @param length 随机字符串长度
     * @return 随机字符串
     */
    public static String generateMixString(int length) {
        StringBuffer sb = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(ALLCHAR.charAt(random.nextInt(LETTERCHAR.length())));
        }
        return sb.toString();
    }

    /**
     * 返回一个定长的随机纯大写字母字符串(只包含大小写字母)
     *
     * @param length 随机字符串长度
     * @return 随机字符串
     */
    public static String generateLowerString(int length) {
        return generateMixString(length).toLowerCase();
    }

    /**
     * 返回一个定长的随机纯小写字母字符串(只包含大小写字母)
     *
     * @param length 随机字符串长度
     * @return 随机字符串
     */
    public static String generateUpperString(int length) {
        return generateMixString(length).toUpperCase();
    }

    /**
     * 生成一个定长的纯0字符串
     *
     * @param length 字符串长度
     * @return 纯0字符串
     */
    public static String generateZeroString(int length) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            sb.append('0');
        }
        return sb.toString();
    }

    /**
     * 根据数字生成一个定长的字符串，长度不够前面补0
     *
     * @param num       数字
     * @param fixdlenth 字符串长度
     * @return 定长的字符串
     */
    public static String toFixdLengthString(long num, int fixdlenth) {
        StringBuffer sb = new StringBuffer();
        String strNum = String.valueOf(num);
        if (fixdlenth - strNum.length() >= 0) {
            sb.append(generateZeroString(fixdlenth - strNum.length()));
        } else {
            throw new RuntimeException("将数字" + num + "转化为长度为" + fixdlenth
                    + "的字符串发生异常！");
        }
        sb.append(strNum);
        return sb.toString();
    }
    /**
     * 每次生成的len位数都不相同
     *
     * @param param
     * @return 定长的数字
     */
    public static int getNotSimple(int[] param, int len) {
        Random rand = new Random();
        for (int i = param.length; i > 1; i--) {
            int index = rand.nextInt(i);
            int tmp = param[index];
            param[index] = param[i - 1];
            param[i - 1] = tmp;
        }
        int result = 0;
        for (int i = 0; i < len; i++) {
            result = result * 10 + param[i];
        }
        return result;
    }

    public static int getIntOfObj(Object obj) {
        try {
            return new Integer(obj.toString()).intValue();
        } catch (Exception e) {
            return 0;
        }
    }

    public static boolean getBooleanOfObj(Object object) {
        try {
            return (Boolean) object;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean getBooleanOfInt(int i) {
        return i == 0 ? false : true;
    }


    public static long getLongOfObj(Object obj) {
        try {
            return new Long(obj.toString()).longValue();
        } catch (Exception e) {
            return 0;
        }
    }

    public static double getDoubleOfObj(Object obj) {
        try {
            return new Double(obj.toString()).doubleValue();
        } catch (Exception e) {
            return 0;
        }
    }

    public static float getFloatOfObj(Object obj) {
        try {
            return new Float(obj.toString()).floatValue();
        } catch (Exception e) {
            return 0;
        }
    }

    public static float getNullFloat(Object obj) {
        try {
            return new Float(obj.toString()).floatValue();
        } catch (Exception e) {
            return 0;
        }
    }
    public static int[] getIntOfObjArry(Object[] objs) {

        int[] result = new int[objs.length];
        for (int i = 0; i < objs.length; i++) {
            result[i] = getIntOfObj(objs[i]);
        }
        return result;
    }

    public static String getNullStr(Object obj) {
        try {
            return obj.toString();
        } catch (Exception e) {
            return "";
        }
    }
    public static Long getNullLong(Object obj) {
        try {

            return Long.valueOf(obj.toString());
        } catch (Exception e) {
            return 0L;
        }
    }

    public static Integer getIntegerOfObj(Object obj) {
        try {
            return Integer.valueOf(obj.toString());
        } catch (Exception e) {
            return Integer.valueOf(0);
        }
    }


    public static int getNullInt(Object obj) {
        try {
            return Integer.parseInt(obj.toString());
        } catch (Exception e) {
            return 0;
        }
    }


    /**
     * 将浮点型保留两位小数
     */
    public static String formartDecimal(Object d) {
        try {
            String str = new java.text.DecimalFormat("#.00").format(d);
            if (str.charAt(0) == '.') // 0.01 格式化为 .01
            {
                str = "0" + str;
            }
            if (str.indexOf("-.") == 0) // -.01 开头
            {
                str = "-0." + str.substring(2);
            }
            if (str.equals("0") || str.equals("0.00")) {
                str = "0";
            }
            return str.replace("-0.00", "").replace(".00", "");
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * 将浮点型保留一位小数
     */
    public static float formartOneDecimal(Object d) {
        if (d == null) {
            return StringUtil.getFloatOfObj(0);
        }
        String str = new java.text.DecimalFormat("#.0").format(d);
        if (str.charAt(0) == '.') // 0.1 格式化为 .01
        {
            str = "0" + str;
        }
        if (str.indexOf("-.") == 0) // -.01 开头
        {
            str = "-0." + str.substring(1);
        }
        if (str.equals("0") || str.equals("0.0")) {
            str = "0";
        }
        return StringUtil.getFloatOfObj(str.replace("-0.0", "").replace(".0", ""));
    }

    /**
     * 去掉首位空格
     */
    public static String getTrimStr(String obj) {
        try {
            return obj.trim();
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * 将以逗号隔开的字符串转换为Integer集合
     */
    public static List<Integer> getNullStrToList(String str) {
        String num[] = str.split(",");
        List<Integer> stateList = new ArrayList<Integer>();
        if (StringUtil.isNotEmpty(str) && num.length > 0 && !str.equals("null")) {
            for (int i = 0; i < num.length; i++) {
                String value = StringUtil.getNullStr(num[i]).trim();
                stateList.add(Integer.parseInt(value));
            }
        } else {
            stateList.add(0);
        }
        return stateList;
    }

    /**
     *  将以逗号隔开的字符串转换为String集合
     */
    public static List<String> getNullStrToStringList(String str) {
        String num[] = str.split(",");
        List<String> stateList = new ArrayList<String>();
        if (StringUtil.isNotEmpty(str) && num.length > 0 && !str.equals("null")) {
            for (int i = 0; i < num.length; i++) {
                stateList.add(num[i]);
            }
        } else {
            stateList.add("");
        }
        return stateList;
    }

    /**
     *  将以逗号隔开的字符串转换为Long集合
     */
    public static List<Long> getNullStrToLongList(String str) {
        List<Long> stateList = new ArrayList<Long>();
        if (StringUtil.isNotEmpty(str)) {
            String num[] = str.split(",");
            if (num.length > 0) {
                for (int i = 0; i < num.length; i++) {
                    stateList.add(StringUtil.getNullLong(num[i]));
                }
            }
        } else {
            stateList.add(0L);
        }

        return stateList;
    }

    /**
     * SQL查询时 like setParameter 加上%%
     */
    public static String getNullStrLike(Object obj) {
        try {
            return "%" + obj.toString() + "%";
        } catch (Exception e) {
            return "%" + "" + "%";
        }
    }

    /**
     * SQL查询时 like setParameter 加上%
     */
    public static String getNullStrLikeSineRight(Object obj) {
        try {
            return obj.toString() + "%";
        } catch (Exception e) {
            return "" + "%";
        }
    }

    /**
     * 格式化字符，去除特殊字符
     *
     * @param s
     * @return
     */
    public static String removeSpecialString(String s) {
        String result = "";
        try {
            if (StringUtil.isNotEmpty(s)) {
                result = s.replace("-", "031d0e7f454111e790907cd30abc9b82");

                result = s.replaceAll("[^(`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？a-zA-Z0-9\\u4e00-\\u9fa5)]", "");
                if (StringUtil.isNotEmpty(result)) {
                    result = s.replaceAll("031d0e7f454111e790907cd30abc9b82", "-");
                }
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return s;

        }
    }

    /**
     * 判断字符传是全为数字.
     *
     * @param str
     * @return
     */
    public static boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }

    /**
     * 判断身份证格式
     *
     * @param idNum
     * @return
     */
    public static Map<String, Object> getIdNumberInfo(String idNum) {
        Map<String, Object> idNumberMap = new HashMap<String, Object>();

        boolean isCorrect = true;
        // 中国公民身份证格式：长度为15或18位，最后一位可以为字母
        Pattern idNumPattern = Pattern.compile("(\\d{14}[0-9a-zA-Z])|(\\d{17}[0-9a-zA-Z])");

        // 格式验证
        if (!idNumPattern.matcher(idNum).matches())
            isCorrect = false;

        // 合法性验证
        int year = 0;
        int month = 0;
        int day = 0;

        if (idNum.length() == 15) {
            // 一代身份证
            System.out.println("一代身份证：" + idNum);
            // 提取身份证上的前6位以及出生年月日
            Pattern birthDatePattern = Pattern.compile("\\d{6}(\\d{2})(\\d{2})(\\d{2}).*");

            Matcher birthDateMather = birthDatePattern.matcher(idNum);

            if (birthDateMather.find()) {
                year = Integer.valueOf("19" + birthDateMather.group(1));
                month = Integer.valueOf(birthDateMather.group(2));
                day = Integer.valueOf(birthDateMather.group(3));
            }
        } else if (idNum.length() == 18) {
            // 二代身份证
            System.out.println("二代身份证：" + idNum);
            // 提取身份证上的前6位以及出生年月日
            Pattern birthDatePattern = Pattern.compile("\\d{6}(\\d{4})(\\d{2})(\\d{2}).*");

            Matcher birthDateMather = birthDatePattern.matcher(idNum);
            if (birthDateMather.find()) {
                year = Integer.valueOf(birthDateMather.group(1));
                month = Integer.valueOf(birthDateMather.group(2));
                day = Integer.valueOf(birthDateMather.group(3));
            }

        }
        // 年份判断，100年前至今
        Calendar cal = Calendar.getInstance();

        // 当前年份
        int currentYear = cal.get(Calendar.YEAR);

        if (year <= currentYear - 100 || year > currentYear)
            isCorrect = false;

        // 月份判断
        if (month < 1 || month > 12)
            isCorrect = false;

        // 日期判断
        // 计算月份天数
        int dayCount = 31;

        switch (month) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                dayCount = 31;
                break;
            case 2:
                // 2月份判断是否为闰年
                if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
                    dayCount = 29;
                    break;
                } else {
                    dayCount = 28;
                    break;
                }
            case 4:
            case 6:
            case 9:
            case 11:
                dayCount = 30;
                break;
        }

        if (day < 1 || day > dayCount)
            isCorrect = false;
        try {
            if (idNum.length() == 15) {
                idNumberMap = getCarInfo15W(idNum);
            } else if (idNum.length() == 18) {
                idNumberMap = getCarInfo(idNum);
            }
        } catch (Exception e) {
            isCorrect = false;
        }

        idNumberMap.put("isCorrect", isCorrect);

        return idNumberMap;
    }

    /**
     * 15位身份证的验证
     *
     * @param
     * @throws Exception
     */
    public static Map<String, Object> getCarInfo15W(String card) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String fyear = "19" + card.substring(6, 8);// 年份
        String fyue = card.substring(8, 10);// 月份
        String fday = card.substring(10, 12);// 日
        String usex = card.substring(14, 15);// 用户的性别
        String sex;
        if (Integer.parseInt(usex) % 2 == 0) {
            sex = "2";
        } else {
            sex = "1";
        }
        Date date = new Date();// 得到当前的系统时间
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String year = format.format(date).substring(0, 4);// 当前年份
        String yue = format.format(date).substring(5, 7);// 月份
        // String fday = format.format(date).substring(8, 10);
        int age = 0;
        if (Integer.parseInt(yue) <= Integer.parseInt(fyue)) { //
            age = Integer.parseInt(year) - Integer.parseInt(fyear) + 1;
        } else {// 当前用户还没过生
            age = Integer.parseInt(year) - Integer.parseInt(fyear);
        }
        map.put("age", age);
        map.put("sex", sex);
        map.put("birthday", fyear + "-" + fyue + "-" + fday);
        return map;
    }

    /**
     * 根据身份证的号码算出当前身份证持有者的性别和年龄 18位身份证
     *
     * @return
     * @throws Exception
     */
    public static Map<String, Object> getCarInfo(String CardCode) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        String fyear = CardCode.substring(6).substring(0, 4);// 得到年份
        String fyue = CardCode.substring(10).substring(0, 2);// 得到月份
        String fday = CardCode.substring(12).substring(0, 2);// 得到日
        String sex;
        if (Integer.parseInt(CardCode.substring(16).substring(0, 1)) % 2 == 0) {// 判断性别
            sex = "2";
        } else {
            sex = "1";
        }
        Date date = new Date();// 得到当前的系统时间
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String year = format.format(date).substring(0, 4);// 当前年份
        String yue = format.format(date).substring(5, 7);// 月份
        // String day = format.format(date).substring(8, 10);
        int age = 0;
        if (Integer.parseInt(yue) <= Integer.parseInt(fyue)) { //
            age = Integer.parseInt(year) - Integer.parseInt(fyear) + 1;
        } else {// 当前用户还没过生
            age = Integer.parseInt(year) - Integer.parseInt(fyear);
        }
        map.put("age", age);
        map.put("sex", sex);
        map.put("birthday", fyear + "-" + fyue + "-" + fday);
        return map;
    }

    /**
     * String类型转Date
     *
     * @author xl
     * @param dateStr
     * @return
     */
    public static Date timeStrToDate(String dateStr) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = format.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        date = java.sql.Date.valueOf(dateStr);
        return date;
    }

    /**
     * Date转String
     *
     * @author xl
     * @param dateDate
     * @return
     */
    public static String dateToStrLong(Date dateDate) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(dateDate);
        return dateString;
    }

    public static void main(String[] args) {
        System.out.println("返回一个定长的随机字符串(只包含大小写字母、数字):" + generateString(10));
        System.out
                .println("返回一个定长的随机纯字母字符串(只包含大小写字母):" + generateMixString(10));
        System.out.println("返回一个定长的随机纯大写字母字符串(只包含大小写字母):"
                + generateLowerString(10));
        System.out.println("返回一个定长的随机纯小写字母字符串(只包含大小写字母):"
                + generateUpperString(10));
        System.out.println("生成一个定长的纯0字符串:" + generateZeroString(10));
        System.out.println("根据数字生成一个定长的字符串，长度不够前面补0:"
                + toFixdLengthString(123, 10));
        int[] in = {1, 2, 3, 4, 5, 6, 7};
        System.out.println("每次生成的len位数都不相同:" + getNotSimple(in, 3));

    }
}
