package com.syg.manage.util;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.Transaction;
import redis.clients.jedis.Tuple;

/**
 * Redis类
 * @author chenhaishen
 *
 */
public class RedisUtil 
{
	/**
	 * 连接池
	 */
	private static JedisPool  pool=null;
	
	/**
	 * 初始化
	 */
	public RedisUtil(String redisHost,int redisPort,String password)
	{
		System.out.println("初始化redis"+redisHost+"==="+redisPort+"====="+password);
		destory();
		// 连接池配置
		JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxActive(100);
        config.setMaxIdle(50);
        //config.setMaxWait(1000);
        //config.setTestOnBorrow(true);
        config.setTestWhileIdle(true);
        // 初始化连接池
//        pool = new JedisPool(config, redisHost,redisPort);
//        pool=new JedisPool(config, redisHost,redisPort, 0, "pksg2011");
//        pool=new JedisPool(config, redisHost,redisPort, 0,null);
        if(password != null && !"".equals(password)){
        	pool=new JedisPool(config, redisHost,redisPort, 0,password);
        }else{
        	pool=new JedisPool(config, redisHost,redisPort, 0,null);
        }
        
	}
	/**
	 * 销毁
	 */
	public static void destory()
	{
		if(pool!=null)
		{
			pool.destroy();
		}
	}
	/**
	 * 获取KEY 不反序列化
	 */
	public static String get(String key)
	{
		Jedis jedis=pool.getResource();
		String result = null;
        try 
        {  
        	result =  jedis.get(key);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 设置Key
	 */
	public static void set(String key,String value)
    {  
		set(key.getBytes(), value.getBytes());
    }
	/**
	 * 设置Key
	 */
	public static void set(byte[] key,byte[] value)
    {  
        Jedis jedis=pool.getResource();
        try 
        {  
            jedis.set(key, value);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
          
    }
	/**
	 * 删除KEY(s)
	 */
	public static void delete(String ... keys)
	{
		Jedis jedis=pool.getResource();
        try 
        {  
        	jedis.del(keys);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 设置单个会过期的key
	 */
	public static void setExpireKey(String key,String value,int expire)
	{
		 Jedis jedis=pool.getResource();
        try 
        {  
            jedis.setex(key, expire, value);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 自增
	 */
	public static Long increment(String key)
	{
		Jedis jedis=pool.getResource();
		Long no = null;
        try 
        {  
        	no = jedis.incr(key);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return no;
	}
	/**
	 * 设置HASH表的值 不序列化
	 */
	public static void hashSet(String key,String field,String value)
	{
		Jedis jedis=pool.getResource();
        try 
        {  
        	jedis.hset(key, field, value);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 获取HASH表的值 不反序列化
	 */
	public static String hashGet(String key,String field)
	{
		Jedis jedis=pool.getResource();
		String result = null;
        try 
        {  
        	result =  jedis.hget(key, field);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 移除HASH表的值
	 */
	public static void hashDelete(String key,String field)
	{
		Jedis jedis=pool.getResource();
        try 
        {  
        	jedis.hdel(key, field);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 获取HASH表的所有的键和值 不反序列化
	 */
	public static Map<String, String> hashGetAll(String key)
	{
		Jedis jedis=pool.getResource();
		Map<String, String> result = null;
        try 
        {  
        	result =  jedis.hgetAll(key);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 批量获取HASH表的键和值 不反序列化
	 */
	public static List<String> hashMultiGet(String key,List<String> fields)
	{
		if(fields.isEmpty())return new LinkedList<String>();
		Jedis jedis=pool.getResource();
		List<String> result = null;
        try 
        {  
        	result =  jedis.hmget(key, fields.toArray(new String[fields.size()]));
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 批量设置HASH表的键和值 不序列化
	 */
	public static void hashMultiSet(String key,Map<String,String>  keyValues)
	{
		Jedis jedis=pool.getResource();
        try 
        {
        	jedis.hmset(key, keyValues);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 批量设置双HASH表的键和值
	 */
	public static void hashDoubleMultiSet(String key1,Map<String,String>  keyValues1,String key2,Map<String,String>  keyValues2)
	{
		Jedis jedis=pool.getResource();
        try 
        {
        	jedis.watch(key1,key2);
        	Transaction t = jedis.multi();
        	t.hmset(key1, keyValues1);
        	t.hmset(key2, keyValues2);
        	t.exec();
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * HASH表中是否存在key
	 */
	public static boolean hashExists(String key,String field)
	{
		Jedis jedis=pool.getResource();
		boolean result = false;
        try 
        {  
        	result =  jedis.hexists(key, field);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * HASH表中field数
	 */
	public static int hashLength(String key)
	{
		Jedis jedis=pool.getResource();
		int result=0;
        try 
        {  
        	result =  jedis.hlen(key).intValue();
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 有序集合 设置用户分数
	 */
	public static void zAdd(String key,double score,String member)
	{
		Jedis jedis=pool.getResource();
        try 
        {  
        	jedis.zadd(key, score, member);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 有序集合 用户分数自增
	 */
	public static double zIncrement(String key,double scoreInc,String member)
	{
		Jedis jedis=pool.getResource();
		double result=0.0d;
        try 
        {  
        	result = jedis.zincrby(key, scoreInc, member);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 有序集合 移除用户
	 */
	public static void zRemove(String key,String member)
	{
		Jedis jedis=pool.getResource();
        try 
        {  
        	jedis.zrem(key, member);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 有序集合 根据排行移除用户
	 */
	public static void zRemoveByRank(String key,int start,int end)
	{
		Jedis jedis=pool.getResource();
        try 
        {  
        	jedis.zremrangeByRank(key, start, end);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 有序集合 降序列表
	 */
	public static Set<Tuple> zRangeDesc(String key,int start,int end)
	{
		Jedis jedis=pool.getResource();
		Set<Tuple> result=null;
        try 
        {  
        	result = jedis.zrevrangeWithScores(key, start, end);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 有序集合 获取某用户排行 降序
	 * 无则返回null
	 */
	public static Long zRankDesc(String key,String member)
	{
		Jedis jedis=pool.getResource();
		Long result=0l;
        try 
        {  
        	result = jedis.zrevrank(key, member);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 有序集合 获取某用户分数
	 * 无则返回null
	 */
	public static Double zScore(String key,String member)
	{
		Jedis jedis=pool.getResource();
		Double result=0.0d;
        try 
        {  
        	result = jedis.zscore(key, member);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	/**
	 * 有序集合 获取排行榜内用户总数
	 */
	public static long zCard(String key)
	{
		Jedis jedis=pool.getResource();
		long result=0;
        try 
        {  
        	result = jedis.zcard(key);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
    
	/**
	 * 列表 从右部推入列表
	 */
	public static void rightPush(String key,String value)
	{
		Jedis jedis=pool.getResource();
        try 
        {  
        	jedis.rpush(key, value);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
	}
	/**
	 * 列表 从左部取出
	 */
	public static String leftPop(String key)
	{
		Jedis jedis=pool.getResource();
		String result=null;
        try 
        {  
        	result = jedis.lpop(key);
        } catch (Exception e) { 
        	e.printStackTrace();
        }finally{
            pool.returnResource(jedis);
        }
        return result;
	}
	
}
