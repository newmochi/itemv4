FactoryGirl.define do
  factory :article do
    sequence(:asciino) { |n| "Article#{n}" }
    category1 "category1"
    category2 "category2"
    servername "APサーバ"
    type_p1v2a9 1
    os_w1x2 1
    osfullname "windows2012r2"
    daisu 2
    core 4
    memgbyte 8
    storagegbyte 20
    remark "remark"
    ownername "Taro"
    rev_date 2.days.ago
  end
end
