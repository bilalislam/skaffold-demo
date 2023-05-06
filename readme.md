## todo 

1. cb
2. sql
3. kafka
4. loadbalancer
5. --skip-tests
6. git clone all service via sh
7. update old version of jib as 3.2.0 (product-api,label-api)
7.1. vm api gradle ve onun jib version'ı 3.2.1 eger maven da destekliyorsa prodda sorun olmaz sanırım.
8. alan yetersiz ise gloud kullanılabilir.

```sh
$ once docker deskop'un kapasitesini cpu : 5 memory : 12.5 gb swap 2gb olarak set
$ minikube start --memory 12000 --cpus 4  -p dev
$ skaffold dev --skip-tests
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