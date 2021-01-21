# 元々の記述は全て削除して大丈夫です
server '3.113.142.18', user: 'ec2-user', roles: %w{app db web}
# 自身のElasticIPの部分は書き換えてください