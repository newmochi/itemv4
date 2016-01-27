# coding: utf-8

class TopController < ApplicationController
  def index

#1.   集計SQLで設置場所別かつ仮想物理別要求リソース
#     1.設置場所一覧取得→2.設置場所トップ2を選択
#     3.トップ2以外はやらないことを宣言
#     4.設置場所トップ2ごとに仮想物理の要求リソース
#     残件．時間があれば設置場所が何個あろうが出力
#1.1. 設置場所一覧取得
    @location_case = Article.find_by_sql(
     ['SELECT DISTINCT location FROM 
              articles order by location'])

#1.2. 設置場所総数取得
    @location_sousu =Article.find_by_sql(
     ['SELECT DISTINCT location FROM 
              articles ']).count

#    以下は数値ではなく出力されるので扱いづらい
#    @location_sousu = Article.find_by_sql(
#     ['SELECT count(DISTINCT location) from "articles"'])

#1.3. 設置場所の種類を表示。その際3箇所以上の場合、CSVに
#     落として自身でやることを示唆。
      # index.html.erbにて表示
#1.4. (1)設置場所TOP1の物理仮想の要求リソース取得
    @art_v = Array.new(5)
    @daisusubtotal = Array.new(5)
    @coresubtotal = Array.new(5)
    @memsubtotal = Array.new(5)
    @stsubtotal = Array.new(5)
    @p_daisuu4v = Array.new(5)

    @art_p = Array.new(5)
    @daisusubtotalp = Array.new(5)
    @coresubtotalp = Array.new(5)
    @memsubtotalp = Array.new(5)
    @stsubtotalp = Array.new(5)

    @repeat = 0

    @location_sousu > 4 ? @repeat = 5 : @repeat = @location_sousu

    @repeat.times do |i|

#    if @location_sousu > 0

      @art_v[i] = Article.select('category1,
        location,sum(daisu) as sum_daisu,
        sum(core*daisu) as sum_core,
        sum(memgbyte*daisu) as sum_memg,
        sum(storagegbyte) as sum_stg' )
        .where(type_p1v2a9: 2)
        .where(daisu: 1..1000 )
        .where(location:  @location_case[i].location)
        .group(:category1)

      @daisusubtotal[i] = 0
      @coresubtotal[i] = 0
      @memsubtotal[i] = 0
      @stsubtotal[i] = 0

      @art_v[i].each do |item|
        @daisusubtotal[i] = @daisusubtotal[i] +item.sum_daisu
        @coresubtotal[i] = @coresubtotal[i]+item.sum_core
        @memsubtotal[i] = @memsubtotal[i]+item.sum_memg
        @stsubtotal[i] = @stsubtotal[i]+item.sum_stg
      end

      @p_daisuu4v[i] = ( 8 * @coresubtotal[i] / 16 / 7) + 1


#ここから物理

      @art_p[i] = Article.select('category1,
        location,sum(daisu) as sum_daisu,
        sum(core*daisu) as sum_core,
        sum(memgbyte*daisu) as sum_memg,
        sum(storagegbyte) as sum_stg' )
        .where(type_p1v2a9: 1)
        .where(daisu: 1..1000 )
        .where(location:  @location_case[i].location)
        .group(:category1)

      @daisusubtotalp[i] = 0
      @coresubtotalp[i] = 0
      @memsubtotalp[i] = 0
      @stsubtotalp[i] = 0

      @art_p[i].each do |item|
        @daisusubtotalp[i] = @daisusubtotalp[i]+item.sum_daisu
        @coresubtotalp[i] = @coresubtotalp[i]+item.sum_core
        @memsubtotalp[i] = @memsubtotalp[i]+item.sum_memg
        @stsubtotalp[i] = @stsubtotalp[i]+item.sum_stg
      end
    end

  end  # def indexの終わり

  def about
  end

  def not_found
    raise ActionController::RoutingError,
      "No route matches #{request.path.inspect}"
  end
end
