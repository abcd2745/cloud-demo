package com.lc.binlog;

import com.github.shyiko.mysql.binlog.BinaryLogClient;
import com.github.shyiko.mysql.binlog.BinaryLogFileReader;
import com.github.shyiko.mysql.binlog.event.*;
import com.github.shyiko.mysql.binlog.event.deserialization.ByteArrayEventDataDeserializer;
import com.github.shyiko.mysql.binlog.event.deserialization.EventDeserializer;
import com.github.shyiko.mysql.binlog.event.deserialization.NullEventDataDeserializer;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;


/**
 * mysql-binlog-connector-java
 * mysql  binlog 日志文件分析
 */
public class MySqlBinlogConnectionDemo {


    /**
     * 读取binlog文件
     * 1.查看mysql是否开启binlog ： show variables like 'log_bin'; (show variables like 'log_%'; 可以看到日志相关结果）
     * 2.查看已产生的binlog： show binary logs ;
     * 参考：https://www.cnblogs.com/jpfss/p/11112283.html
     *
     * @throws IOException
     */
    @Test
    public void testRead() throws IOException {

        Map<Long, TableMapEventData> tableMap = new ConcurrentHashMap<>();

        InputStream is = this.getClass().getResourceAsStream("/mysql-bin.000001");

        EventDeserializer eventDeserializer = new EventDeserializer();
        eventDeserializer.setCompatibilityMode(
                EventDeserializer.CompatibilityMode.DATE_AND_TIME_AS_LONG,
                EventDeserializer.CompatibilityMode.CHAR_AND_BINARY_AS_BYTE_ARRAY
        );

        BinaryLogFileReader reader = new BinaryLogFileReader(is, eventDeserializer);
        try {
            for (Event event; (event = reader.readEvent()) != null; ) {

                EventHeaderV4 header = event.getHeader();

                EventType eventType = header.getEventType();
                if (eventType == EventType.TABLE_MAP) {

                    TableMapEventData tableMapEvent = event.getData();
                    tableMap.put(tableMapEvent.getTableId(), tableMapEvent);

                } else if (eventType == EventType.EXT_UPDATE_ROWS) {
                    UpdateRowsEventData updateRowsEventData = event.getData();

                    long tableId = updateRowsEventData.getTableId();

                    TableMapEventData tableMapEvent = tableMap.get(tableId);

                    System.out.println("-----------------------------" + tableMapEvent.getTable());

                    //表名
                    if (!tableMapEvent.getTable().equals("hw_hdds_grab_notice")) {
                        continue;
                    }

                    //列名
                    System.out.println(Arrays.toString(tableMapEvent.getColumnMetadata()));
                    System.out.println(Arrays.toString(tableMapEvent.getColumnTypes()));

                    System.out.println(tableMapEvent.getColumnNullability().toString());

                    List<Map.Entry<Serializable[], Serializable[]>> rows = updateRowsEventData.getRows();


                    for (Map.Entry<Serializable[], Serializable[]> row : rows) {
                        Serializable[] value = row.getValue();

                        for (Serializable serializable : value) {
                            if (serializable != null) {
                                Type t = serializable.getClass().getGenericSuperclass();
                                System.out.println(t.getTypeName());
                            }
                        }
                    }
                } else if (eventType == EventType.EXT_WRITE_ROWS) {
                    WriteRowsEventData data = event.getData();
//                    System.out.println(data);

                } else if (eventType == EventType.EXT_DELETE_ROWS) {
                    DeleteRowsEventData data = event.getData();

//                    System.out.println(data);

                }

            }
        } finally {
            reader.close();
        }
    }

    /**
     * 通过自定义的EventDeserializer
     *
     * @throws IOException
     */
    @Test
    public void testRead2() throws IOException {

        InputStream is = this.getClass().getResourceAsStream("/mysql-bin.000001");

        EventDeserializer eventDeserializer = new EventDeserializer();
        eventDeserializer.setCompatibilityMode(
                EventDeserializer.CompatibilityMode.DATE_AND_TIME_AS_LONG_MICRO,
                EventDeserializer.CompatibilityMode.CHAR_AND_BINARY_AS_BYTE_ARRAY
        );

        // do not deserialize EXT_DELETE_ROWS event data, return it as a byte array
        eventDeserializer.setEventDataDeserializer(EventType.EXT_DELETE_ROWS,
                new ByteArrayEventDataDeserializer());

        // skip EXT_WRITE_ROWS event data altogether
        eventDeserializer.setEventDataDeserializer(EventType.EXT_WRITE_ROWS,
                new NullEventDataDeserializer());


        BinaryLogFileReader reader = new BinaryLogFileReader(is, eventDeserializer);

        try {
            /**
             * Write_rows
             * Table_map
             * Update_rows
             */
            for (Event event; (event = reader.readEvent()) != null; ) {

            }
        } finally {
            reader.close();
        }
    }

    /**
     * 实时读取binlog
     * 查看事件：show binlog events ;
     */
    @Test
    public void testDemo() throws IOException {
        BinaryLogClient client = new BinaryLogClient("10.0.19.197", 3306, "pos", "hotwind");
        EventDeserializer eventDeserializer = new EventDeserializer();
        eventDeserializer.setCompatibilityMode(
                EventDeserializer.CompatibilityMode.DATE_AND_TIME_AS_LONG_MICRO,
                EventDeserializer.CompatibilityMode.CHAR_AND_BINARY_AS_BYTE_ARRAY
        );

        // do not deserialize EXT_DELETE_ROWS event data, return it as a byte array
        eventDeserializer.setEventDataDeserializer(EventType.EXT_DELETE_ROWS,
                new ByteArrayEventDataDeserializer());

        // skip EXT_WRITE_ROWS event data altogether
        eventDeserializer.setEventDataDeserializer(EventType.EXT_WRITE_ROWS,
                new NullEventDataDeserializer());

        // use custom event data deserializer for EXT_DELETE_ROWS


        client.setEventDeserializer(eventDeserializer);
        client.registerEventListener((event) -> {
            System.out.println(event.toString());
        });
        client.connect();
    }

}
