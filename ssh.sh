#/bin/bash
#1.创建密钥
echo "正在创建..."
if [ -f /root/.ssh/id_rsa ]
then
  echo "密钥对已经存在"
else
  ssh-keygen -f /root/.ssh/id_rsa -N '' > /tmp/create_ssh.log 2>&1
fi

#分发密钥
echo "正在分发..."
#for ip in $(cat ip_list.txt)
for ip in  192.168.1.179 192.168.1.4
do
  sshpass -p "123456" ssh-copy-id ${ip} -o StrictHostKeyChecking=no > /tmp/create_ssh.log 2>&1
  echo "验证结果: $(ssh ${ip} hostname)"
done

