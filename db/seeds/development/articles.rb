# coding: utf-8

cat1names = ["ca1_1","cat1_2","cat1_3","cat1_4","cat1_5",\
"cat1_6","cat1_7","cat1_8","cat1_9",\
"cat1_10","cat1_11"]

cat2names = ["機能A","機能B","機能C"]
sernames = ["APサーバ","DBサーバ","Webサーバ"]
corenums = [ 1, 2, 3, 4 ]
0.upto(19) do |idx|
  Article.create(
    asciino: "no#{idx}",
    category1: "#{cat1names[idx % 11]}",
    category2: "#{cat2names[idx % 3]}",
    servername: "#{sernames[idx % 3]}",
    type_p1v2a9: 1 + idx % 2,
    os_w1x2: 1,
    daisu: idx,
   core: 1 + idx % 2,
   memgbyte: 4 + 4 * idx % 2,
   storagegbyte: 40 + 10 * idx % 4,
    ownername: "Taro",
    rev_date: 8.days.ago.advance(days: idx)

  )
end
