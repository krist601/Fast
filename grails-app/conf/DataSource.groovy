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
            dbCreate = "create-drop"
            url = "jdbc:postgresql:FastDatabase"
          
        } 
    }   
}
