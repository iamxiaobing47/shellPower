1. 配置yum仓库

```shell
# 更新密钥
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

#安装mysql yum库
rpm -Uvh https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm
```

2. 使用yum安装mysql

```shell
yum -y install mysql-community-server
```

3. 配置开机自启

```shell
systemctl start mysqld
systemctl enable mysqld
```

4. 获取原始密码

```shell
grep 'temporary password' /var/log/mysqld.log
```

5. 登陆

```shell
mysql -u root -p
```

6. 更改root密码

```shell
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'indydemo';
```