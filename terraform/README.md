### resource: 실제로 생성할 인프라 자원
- aws_security_group
- aws_lb
- aws_instance

### provider: terraform으로 정의할 infrastructure provider

### output: 인프라를 프로비저닝 한 후에 생성된 자원
- remote state에서 활용 가능

### backend: terraform의 상태를 저장할 공간 지정
- aws s3

### module: 공통적으로 활용할 수 있는 인프라 코드를 한 곳으로 모아서 정의하는 부분
- 변수만 바꿔서 동일한 리소스를 손쉽게 생성할 수 있다.

### remote state: VPM, IAM 등과 같은 공용 서비스를 다른 서비스에서 참조할 수 있다.
- tfstate파일(최신 테라폼 상태정보)이 저장되어 있는 backend 정보를 명시하면 terraform이 해당 backend에서 output 정보들을 가져온다.