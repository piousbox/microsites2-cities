
FactoryGirl.define do

  factory :report do
  
    name 'Report name'
    name_seo 'Report-name'
    created_at '2012-01-01'
    is_feature true
    # association :tag

    after(:build) do |r|
      r.user = User.first || User.new
      r.save
    end

  end

  factory :cac1, :parent => :report do
    name 'blah blah  ssss'
    name_seo 'blah-blah_544'
    created_at '2012-01-01'
    
    after(:build) do |r|
      r.tag = Tag.where( :name_seo => 'cac' ).first
      r.user = User.first
      r.save
    end
    
  end 
  
  factory :r1, :parent => :report do
    name 'blah blah'
    name_seo 'blah-blah'
    created_at '2012-01-01'
    is_trash false
    is_public true
    
    after(:build) do |r|
      r.tag = Tag.where( :domain => 'test.local' ).first
      r.user = User.first
      r.save
    end
    
  end 

  factory :r2, :class => Report do
    name 'blah blah.2'
    name_seo 'blah-blah244'
    created_at '2012-02-01'
    is_trash false
    is_public true
    
    after(:build) do |r|
      r.tag = Tag.where( :domain => 'test.local' ).first
      r.user = User.first
    end
    
  end 

  factory :r3, :class => Report do
    name 'blah blah 3'
    name_seo 'blah-blah-3'
    created_at '2012-01-02'
    is_trash false
    is_public true
    
    after(:build) do |r|
      r.tag = Tag.where( :domain => 'test.local' ).first
      r.user = User.first
      r.save
    end
  end
  
  factory :r4, :class => Report do
    name 'blah blah 4'
    name_seo 'blah-blah-4'
    created_at '2012-01-10'
    
    after(:build) do |r|
      r.tag = Tag.where( :name => 'Tag 2' ).first
      r.user = User.first
      r.save
    end
    
  end
  
  factory :r5, :class => Report do
    name 'blah 1-'
    name_seo 'blah_1'
    created_at '2012-01-10'
    
    after(:build) do |r|
      r.tag = Tag.where( :name => 'Tag 2' ).first
      r.user = User.first
      r.save
    end
    
  end
  factory :r6, :class => Report do
    name 'blah 2-'
    name_seo 'blah_2'
    created_at '2012-01-10'
    
    after(:build) do |r|
      r.tag = Tag.where( :name => 'Tag 2' ).first
      r.user = User.first
      r.save
    end
    
  end

  factory :r7, :class => Report do
    name 'blah 3-'
    name_seo 'blah_3'
    created_at '2012-01-10'
    
    after(:build) do |r|
      r.tag = Tag.where( :name => 'Tag 2' ).first
      r.user = User.first
      r.save
    end
    
  end
  factory :r8, :class => Report do
    name 'blah 4-'
    name_seo 'blah_4'
    created_at '2012-01-10'
    
    after(:build) do |r|
      r.tag = Tag.where( :name => 'Tag 2' ).first
      r.user = User.first
      r.save
    end
    
  end
  
  factory :r9, :class => Report do
    name 'blah 9'
    name_seo 'blah_9'
    created_at '2012-01-10'
    is_trash 0
    is_public 1
    
    after(:build) do |r|
      r.city = City.where( :cityname => 'rio' ).first
      r.user = User.first
      r.save
    end
    
  end
  
  factory :r11, :class => Report do
    name 'blah 9 ola'
    name_seo 'ola'
    created_at '2012-01-10'
    is_trash 0
    is_public 1
    
    after(:build) do |r|
      r.city = City.where( :cityname => 'rio' ).first
      r.user = User.first
      r.save
    end
    
  end

  factory :r12, :class => Report do
    name 'blah 12 ola'
    name_seo 'ola12'
    created_at '2012-01-10'
    is_trash 0
    is_public 1
    domain 'blog.test.local'

    after(:build) do |r|
      r.city = City.where( :cityname => 'rio' ).first
      r.user = User.first
      r.save
    end

  end

  factory :r13, :class => Report do
    name 'blah 13 ola'
    name_seo 'ola13'
    created_at '2012-01-10'
    is_trash 0
    is_public 1
    domain 'blog.test.local'

    after(:build) do |r|
      r.city = City.where( :cityname => 'rio' ).first
      r.user = User.first
      r.save
    end

  end

  factory :r_pt_1, :class => Report do
    name 'blah 13 ola'
    name_seo 'ola11113'
    created_at '2012-01-10'
    is_trash 0
    descr 'texto'
    is_public 1
    domain 'blog.test.local'
    lang 'pt'
    after(:build) do |r|
      r.city = City.where( :cityname => 'rio' ).first
      r.user = User.first
      r.save
    end
  end

  factory :r_pt_2, :class => Report do
    name 'blah 1322 ola'
    name_seo 'ola213'
    descr 'texto'
    created_at '2012-01-10'
    is_trash 0
    is_public 1
    domain 'blog.test.local'
    lang 'pt'
    after(:build) do |r|
      r.city = City.where( :cityname => 'rio' ).first
      r.user = User.first
      r.save
    end
  end

  factory :r_pt_3, :class => Report do
    name 'blah1111 13 ola'
    name_seo 'ol11a313'
    created_at '2012-01-10'
    is_trash 0
    descr 'texto'
    is_public 1
    domain 'blog.test.local'
    lang 'pt'
    after(:build) do |r|
      r.city = City.where( :cityname => 'rio' ).first
      r.user = User.first
      r.save
    end
  end

  factory :report_blog, :class => Report do
    name 'blah 13 ola'
    name_seo 'o1la13'
    created_at '2012-01-10'
    is_trash false
    is_public true
    domain 'blog.test.local'

    after(:build) do |r|
      r.city = City.where( :cityname => 'rio' ).first
      r.user = User.first
      r.save
    end

  end

  factory :feature_pt_1, :class => Report do
    name 'Feature pt 1'
    is_trash false
    is_feature true
    is_public true
    lang 'pt'
    after :build do |r|
      r.user = User.first
    end

  end

  factory :feature_ru_1, :class => Report do
    name 'Feature ru 1'
    is_trash false
    is_feature true
    is_public true
    lang 'ru'
    after :build do |r|
      r.user = User.first
    end

  end
    
end
