dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    dialect = org.hibernate.dialect.PostgreSQLDialect
    username = "Admin"
	password = "admin"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql:FastDatabase"
       
        }   
    }   
    test {
         dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql:FastDatabase"
            
        }  
    }   
   production {
    dataSource {
        dbCreate = "update"
        driverClassName = "org.postgresql.Driver"
        dialect = org.hibernate.dialect.PostgreSQLDialect

        uri = new URI(System.env.DATABASE_URL?:"postgres://viatomflnqabzl:5iiSo5nXisdQghOZ-yGn6wpzn5@ec2-184-73-221-47.compute-1.amazonaws.com:5432/dfs4sgk72363go")

        url = "jdbc:postgresql://"+uri.host+uri.path
        username = uri.userInfo.split(":")[0]
        password = uri.userInfo.split(":")[1]
    }
}
}
