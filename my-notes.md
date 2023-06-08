## todo 

1. cb -  ok  

## cb missing configuration - nok
todo :  predefined bucket ve indexing yapmak lazım default olarak. Yoksa get calısmıyor. CB default index istiyor bucket için
https://www.couchbase.com/forums/t/setting-up-a-cluster-and-a-bucket-programmatically-through-docker/32130


2. sql,redis,elk
3. kafka - ok 
4. loadbalancer
5. --skip-tests
6. git clone all service via sh - ok
7. update old version of jib as 3.2.0 (product-api,label-api)
8. vm api gradle ve onun jib version'ı 3.2.1 eger maven da destekliyorsa prodda sorun olmaz sanırım.
9. alan yetersiz ise gcloud kullanılabilir. (debug skaffold yaml ile per service olarak daha hızlı) - ok
10. branch base env passsing yapmamız lazım
11. portları fix edip default referans olarak pass edilmeli
12. http url'leri env olarak gecilemiyor spring boot dısında o yuzden aktif olmayanlar için config json olusturmak lazım
13. build uzun sürüyor hepsi için hızlandırmak lazım
14. build the all projects
15. pi'ı da dahil et

```sh
$ once docker deskop'un kapasitesini cpu : 5 memory : 12.5 gb swap 2gb olarak set
$ brew install skaffold@1.39
$ sh git-clone-all.sh
$ minikube start --memory 12000 --cpus 4  -p dev
$ skaffold dev --skip-tests
$ minikube delete -p dev
```

Dns testing to get kube dns endpoint

```sh
$ kubectl run -i --tty --image busybox dns-test --restart=Never --rm
$ nslookup {service_name}
```

port forwarding

```sh
$ kubectl get pods
$ kubectl port-forward {pod_name} 8086:8086
```

## notes

1. tilt'in hiç mvn orneği vs yok, sadece quarkus var ama complex app'lerin build oldugunu anlatmamıslar ama gradle ile  cok var
2. jib üzerinde karar kılmamın sebebi en az değişiklik ile repoya müdahale etmeden calısabileceğimiz ve size'ı daha az image build ediyor.
3. jib soz konusu olunca da skaffold built in olarak support veriyor ama tilt için cok custom build kullanmak gerekiyor. Basir bir dili yok.
4. skaffold için sadece jib'in en az 3.2.0 version'ını kurmak gerekiyor. Maven ve gradle 'ı derlemek cok basit. 
5. docker ile mvn build olmuyor tyol repodan pim-starter'ı cekmiyor. Hepsi dockerize edilse sorun değil ama domain'imizde ki agırlıklı proje java oldugu için en optimize olan build aracı jib.
6. ek olarak tyolda deploy ettiğimiz cluster'ı simule eden ve kullanılan build aracını kullanmak debug için onemli.
7. tilt'in ui'ı var ama skaffold için lens kullanabiliriz.
8. sonuc olarak hangisini kullanırsak kullanalım cok ram ve cpu yiyor o yuzden de jib lazım ama yeterli olmayabilir yine.
9. go'nun build olması yavas daha basit stratch image'ı bulabilir miyiz ?
10. build takıldıgında deployment'a restart atılınca da boot edebiliyor ama ne kadar verimli tartısılır !
11. ref: https://github.com/GoogleContainerTools/skaffold/blob/main/examples/multiple-renderers/skaffold.yaml

build olamayanlar,
1. pim-read-api build olamıyor ? (java sdk'dan dolayı sanırım)

run edilemeyenler,
1. product excel api - ok 
2. notificatiton service - ok
3. projector boot olmadı - ok (platform --platform=linux/arm64,linux/amd64)
4. label event publisher - ok (statusCheckDeadlineSeconds: 300)
5. product excel api consumer - (rabbitmq sorunu)
6. content editor api - ok
7. procen excel api kafkadan dolayı - ok


## cb on k8s refs 

1. https://www.couchbase.com/blog/minikube-rapid-dev-testing-kubernetes/
2. https://github.com/arun-gupta/kubernetes-java-sample/tree/master
