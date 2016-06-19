package com.jackcoin.util;

import java.util.UUID;

/**
 * Created by zuohl on 2016/6/19.
 */
public class Utils {
    public static String getUuid(){
        return UUID.randomUUID().toString().replace("-", "");
    }

}
