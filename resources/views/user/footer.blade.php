@section('footer')
<footer class="footer">

    <p class="float-end"><a href="#" class="link-dark descriptionLink"><i
                class="fa-solid fa-circle-chevron-up"></i> Back to top</a></p>
    @foreach($companyDatas as $companyData)
    &copy; 2021–{{date('Y')}} {{$companyData->name}} &middot;
    {{$companyData->address_zip_code}} {{$companyData->address_city}} {{$companyData->address}} &middot;
    {{$companyData->phone_number}} &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
    <img src="images/favicon-32x32.png" alt="logo" title="logo"></p>
    @endforeach
</footer>
@endsection
