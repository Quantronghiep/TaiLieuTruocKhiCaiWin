const contentTabProduct = {}
const lifeStyleBtn=document.getElementById('life-style');
const eduBtn=document.getElementById('edu');
const enrichBtn=document.getElementById('enrich');
const comicBtn=document.getElementById('comic');
const tieuThuyetBtn=document.getElementById('tieuthuyet');
lifeStyleBtn.onclick= ()=>{
  document.getElementById('content-tab-product').innerHTML = contentTabProduct.lifeStyle
}
eduBtn.onclick= ()=>{
  document.getElementById('content-tab-product').innerHTML = contentTabProduct.edu
}
enrichBtn.onclick= ()=>{
  document.getElementById('content-tab-product').innerHTML = contentTabProduct.enrich
}
comicBtn.onclick= ()=>{
  document.getElementById('content-tab-product').innerHTML = contentTabProduct.comic
}
tieuThuyetBtn.onclick= ()=>{
  document.getElementById('content-tab-product').innerHTML = contentTabProduct.tieuthuyet
}



var header = document.getElementById('nav-active');
var btns= header.getElementsByClassName('active-btn');
for(var i=0 ; i< btns.length ; i++){
  btns[i].addEventListener('click',function(){
    var current = document.getElementsByClassName('active-block');
    current[0].className = current[0].className.replace(" active-block", "");
    this.className +=" active-block";
  })
}
contentTabProduct.lifeStyle = `
<div class="tab-content">
<div class="box-products">
  <div class="row">
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach1.jpg" alt="">
          </a>
          <span>-22%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm (Khổ Lớn) (Tái Bản)
              </a>
          </h4>
          <div class="show-list">
            <p>
              Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...	  
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              76.000 đ 
            </p>
            <p class="price-well">                 
              59.280 đ  
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem" id="detail"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class=" product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach2.jpg" alt="">
          </a>
          <span>-5%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm - Thuật Đắc Nhân Tâm Dụng Nhân (Tái Bản 2017)
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              68,000 ₫
            </p>
            <p class="price-well">                 
                  52,360 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>   
  </div>
  <div class="row">
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach3.jpg" alt="">
          </a>
          <span>-16%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm (Khổ Nhỏ)
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              51,200 ₫
            </p>
            <p class="price-well">                 
                  64,000 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach4.jpg" alt="">
          </a>
          <span>-20%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm - Businessbook (Sách 4 Màu)
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              75,000 ₫
            </p>
            <p class="price-well">                 
                  60,000 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet" onclick="demnguoc()"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>   
  </div>
</div>
</div>
`

contentTabProduct.edu = `
<div class="tab-content">
  <div class="box-products">
    <div class="row">
      <div class="product_1 col-sm-6 col-md-6 col-xs-12">
        <div class="row">
          <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
            <a href="#">
              <img src="vendor/img/giaoduc1.jpg" alt="">
            </a>
            <span>-30%</span>
          </div>
          <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
            <h4 class="title-product">
                <a href="#">
                Giáo Dục Kỹ Năng Sống - Lớp 1
                </a>
            </h4>
            <div class="show-list">
              <p>
                Một trong những cuốn sách giáo dục về kỹ năng sống cho học sinh ...	  
              </p>        
            </div>
            <div class="price-product">
              <p class="price-before">
                35.000 đ 
              </p>
              <p class="price-well">                 
                24.500 đ  
              </p>
            </div>
            <div class="action-product">
              <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
              <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
              <a class="item-action btn-showItem" id="detail"><i class="fa fa-eye"></i></a>
            </div>
          </div>
        </div>
      </div>
      <div class=" product_1 col-sm-6 col-md-6 col-xs-12">
        <div class="row">
          <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
            <a href="#">
              <img src="vendor/img/giaoduc2.jpg" alt="">
            </a>
            <span>-30%</span>
            </div>
            <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
              <h4 class="title-product">
                  <a href="#">
                  Giáo Dục Kỹ Năng Sống - Lớp 7
                  </a>
              </h4>
              <div class="show-list">
                <p>
                  Một trong những cuốn sách giáo dục về kỹ năng sống cho học sinh ...	  
                </p>        
              </div>
              <div class="price-product">
                <p class="price-before">
                  35.000 đ 
                </p>
                <p class="price-well">                 
                  24.500 đ  
                </p>
              </div>
            <div class="action-product">
              <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
              <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
              <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
            </div>
          </div>
        </div>
      </div>   
    </div>
    <div class="row">
      <div class="product_1 col-sm-6 col-md-6 col-xs-12">
        <div class="row">
          <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
            <a href="#">
              <img src="vendor/img/giaoduc3.jpg" alt="">
            </a>
            <span>-30%</span>
            </div>
            <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
              <h4 class="title-product">
                  <a href="#">
                  Giáo Dục Kỹ Năng Sống - Lớp 4
                  </a>
              </h4>
              <div class="show-list">
                <p>
                  Một trong những cuốn sách giáo dục về kỹ năng sống cho học sinh ...	  
                </p>        
              </div>
              <div class="price-product">
                <p class="price-before">
                  35.000 đ 
                </p>
                <p class="price-well">                 
                  24.500 đ  
                </p>
              </div>
            <div class="action-product">
              <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
              <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
              <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
            </div>
          </div>
        </div>
      </div>
      <div class="product_1 col-sm-6 col-md-6 col-xs-12">
        <div class="row">
          <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
            <a href="#">
              <img src="vendor/img/giaoduc4.jpg" alt="">
            </a>
            <span>-30%</span>
            </div>
            <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
              <h4 class="title-product">
                  <a href="#">
                  Giáo Dục Kỹ Năng Sống - Lớp 6
                  </a>
              </h4>
              <div class="show-list">
                <p>
                  Một trong những cuốn sách giáo dục về kỹ năng sống cho học sinh ...	  
                </p>        
              </div>
              <div class="price-product">
                <p class="price-before">
                  35.000 đ 
                </p>
                <p class="price-well">                 
                  24.500 đ  
                </p>
              </div>
            <div class="action-product">
              <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
              <a class="item-action btn-retweet" onclick="demnguoc()"><i class="fa fa-retweet"></i></a>
              <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
            </div>
          </div>
        </div>
      </div>   
    </div>
  </div>
</div>
`
contentTabProduct.enrich = `
<div class="tab-content">
<div class="box-products">
  <div class="row">
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/giau1.jpg" alt="">
          </a>
          <span>-22%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Làm Giàu
              </a>
          </h4>
          <div class="show-list">
            <p>
              Một trong những cuốn sách làm giàu bán chạy nhất trên thế giới...	  
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              106.000 đ 
            </p>
            <p class="price-well">                 
              82.280 đ  
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem" id="detail"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class=" product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/giau2.jpg" alt="">
          </a>
          <span>-30%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
              Làm Giàu Theo Cách “Bá Đạo”
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              139,000 ₫
            </p>
            <p class="price-well">                 
                  97,360 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>   
  </div>
  <div class="row">
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/giau4.jpg" alt="">
          </a>
          <span>-21%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
              Những Bí Quyết Làm Giàu Nổi Tiếng
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              80,000 ₫
            </p>
            <p class="price-well">                 
                  63,000 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach4.jpg" alt="">
          </a>
          <span>-20%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm - Businessbook (Sách 4 Màu)
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              75,000 ₫
            </p>
            <p class="price-well">                 
                  60,000 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet" onclick="demnguoc()"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>   
  </div>
</div>
</div>
`
contentTabProduct.comic = `
<div class="tab-content">
<div class="box-products">
  <div class="row">
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/truyen1.jpg" alt="">
          </a>
          <span>-5%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
              KINGDOM - Tập 1 - Tặng Thẻ Hình Nhân Vật
              </a>
          </h4>
          <div class="show-list">
            <p>
              Một trong những cuốn truyện bán chạy nhất trên thế giới...	  
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              22.000 đ 
            </p>
            <p class="price-well">                 
              20.900 đ  
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem" id="detail"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class=" product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/truyen2.jpg" alt="">
          </a>
          <span>-5%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
              Yaiba - Tập 6
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn truyện bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              22,000 ₫
            </p>
            <p class="price-well">                 
                  20,900 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>   
  </div>
  <div class="row">
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/truyen3.jpg" alt="">
          </a>
          <span>-5%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
              Jin - Tập 18
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn truyện bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              35,200 ₫
            </p>
            <p class="price-well">                 
                  33,250 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/truyen4.jpg" alt="">
          </a>
          <span>-18%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
              Quan Hệ Bạn Bè? - Tập 1
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn truyện bán chạy nhất trên thế giới...	    
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              35,000 ₫
            </p>
            <p class="price-well">                 
              28,000 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet" onclick="demnguoc()"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>   
  </div>
</div>
</div>
`


contentTabProduct.tieuthuyet = `
<div class="tab-content">
<div class="box-products">
  <div class="row">
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach1.jpg" alt="">
          </a>
          <span>-22%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm (Khổ Lớn) (Tái Bản)
              </a>
          </h4>
          <div class="show-list">
            <p>
              Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...   
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              76.000 đ 
            </p>
            <p class="price-well">                 
              59.280 đ  
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem" id="detail"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class=" product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach2.jpg" alt="">
          </a>
          <span>-5%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm - Thuật Đắc Nhân Tâm Dụng Nhân (Tái Bản 2017)
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...      
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              68,000 ₫
            </p>
            <p class="price-well">                 
                  52,360 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>   
  </div>
  <div class="row">
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach3.jpg" alt="">
          </a>
          <span>-16%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm (Khổ Nhỏ)
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...      
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              51,200 ₫
            </p>
            <p class="price-well">                 
                  64,000 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>
    <div class="product_1 col-sm-6 col-md-6 col-xs-12">
      <div class="row">
        <div class="product_1_img col-md-6 col-sm-6 col-xs-12">
          <a href="#">
            <img src="vendor/img/sach4.jpg" alt="">
          </a>
          <span>-20%</span>
        </div>
        <div class="product_1_content col-md-6 col-sm-6 col-xs-12">
          <h4 class="title-product">
              <a href="#">
                Đắc Nhân Tâm - Businessbook (Sách 4 Màu)
              </a>
          </h4>
          <div class="show-list">
            <p>
               Một trong những cuốn sách kỹ năng sống bán chạy nhất trên thế giới...      
            </p>        
          </div>
          <div class="price-product">
            <p class="price-before">
              75,000 ₫
            </p>
            <p class="price-well">                 
                  60,000 ₫
            </p>
          </div>
          <div class="action-product">
            <a class="item-action btn-add-to-cart"><i class="fa fa-shopping-cart"></i></a>
            <a class="item-action btn-retweet" onclick="demnguoc()"><i class="fa fa-retweet"></i></a>
            <a class="item-action btn-showItem"><i class="fa fa-eye"></i></a>
          </div>
        </div>
      </div>
    </div>   
  </div>
</div>
</div>
`
