class BankAccount < ActiveRecord::Base
  # Audited
  audited
  # Central Bank Code
  @central_bank_codes = {'001' => "한국은행", '002' => "산업은행", '003' => "기업은행", '004' => "국민은행", '005' => "외환은행", '007' => "수협중앙회", '008' => "수출입은행", '011' => "농협중앙회", '012' => "단위 농축협", '020' => "우리은행", '023' => "SC은행", '027' => "한국시티은행", '045' => "새마을금고중앙회", '048' => "신협중앙회", '071' => "우체국", '081' => "하나은행", '088' => "신한은행"}
  # Local Bank Code
  @local_bank_codes = {'031' => "대구은행", '032' => "부산은행", '034' => "광주은행", '035' => "제주은행", '037' => "전북은행", '039' => "경남은행", '050' => "상호저축은행", '064' => "산림조합중앙회"}
  # Global Bank Code
  @global_bank_codes = {'052' => "모건스탠리은행", '054' => "HSBC은행", '055' => "도이치은행", '056' => "알비에스피엘씨은행", '057' => "제이피모간체이스은행", '058' => "미즈호은행", '059' => "미쓰비시도쿄UFJ은행", '060' => "BOA은행", '061' => "비엔피파리바은행", '062' => "중국공상은행", '063' => "중국은행", '065' => "대화은행"}
  # Special Bank Code
  @special_bank_codes = {'076' => "신용보증기금", '077' => "기술보증기금", '092' => "한국정책금용공사", '093' => "한국주택금융공사", '094' => "서울보증보험", '095' => "경찰청", '096' => "한국전자금융(주)", '099' => "금융결제원"}
  # All Bank Code
  @bank_codes = @central_bank_codes.merge(@local_bank_codes.merge(@global_bank_codes.merge(@special_bank_codes)))

  # Validation
  validates :bank_code, inclusion: {in: @bank_codes.keys }
  validates :account_number, format: {with: /[0-9\-]*/, message: "Invalid account number"}

  # Association
  belongs_to :trucking_company
end
