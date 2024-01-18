import 'package:flikcar_inspection/models/body_type.dart';
import 'package:flikcar_inspection/models/color_model.dart';
import 'package:flikcar_inspection/models/ownership_type.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/listing_car_features.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_comfort.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_entertainment.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_exterior.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_interior.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/car_safety.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/listing_car_features/widgets/comment_on_basic.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/widgets/select_brand_model_varient.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/widgets/select_color.dart';
import 'package:flikcar_inspection/screens/vehicle_inspection/basic_document_details/widgets/select_rto.dart';
import 'package:flikcar_inspection/services/get_basic_details.dart';
import 'package:flikcar_inspection/services/upload_basic_details.dart';
import 'package:flikcar_inspection/services/upload_images.dart';
import 'package:flikcar_inspection/services/vehicle_inspection_service.dart';
import 'package:flikcar_inspection/utils/app_fonts.dart';
import 'package:flikcar_inspection/widgets/custom_dropdown.dart';
import 'package:flikcar_inspection/widgets/custom_textfield.dart';
import 'package:flikcar_inspection/widgets/dateTime_textfield.dart';
import 'package:flikcar_inspection/widgets/multi_line_textfield.dart';
import 'package:flikcar_inspection/widgets/primary_button.dart';
import 'package:flikcar_inspection/widgets/upload1_image.dart';
import 'package:flikcar_inspection/widgets/upload_basic_images.dart';
import 'package:flikcar_inspection/widgets/upload_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicDocumentDetails extends StatefulWidget {
  final String vehicleId;
  const BasicDocumentDetails({super.key, required this.vehicleId});
  static TextEditingController controller = TextEditingController();

  static String appointmentId = "7877";

  static String customerContactNumber = "";
  static String inspectorName = "";
  static int customerExpectedPrice = 0;
  static String city = "";
  static String? registerationType;
  static String? registerationNumber;
  static String? rcAvailability;
  static String? rcCondition;
  static String? registerationDate;
  static String? fitnessUpto;
  static String? toBeScrapped;
  static String? registerationState;
  static String? registeredRtoVahan;
  static String? ownershipType;
  static String? brand;
  static String? model;
  static String? varient;
  static String? engineNumber;
  static String? chasisNumber;
  static String? registeredOwnerName;
  static String? manufacturingMonth;
  static int? manufacturingYear;

  static String? fuelType;
  static String? engineCC;
  static String? hypothecationDetails;
  static int? seatingCapacity;
  static String? mismatchRC;
  static String? roadTax;
  static String? roadTaxValidity;
  static String? insurance;
  static String? insuranceValidity;
  static String? noClaimBonus;
  static String? misMatchInsurance;
  static String? duplicateKey;
  static String? rtoNoc;
  static String? rtoNocIssueDate;
  static String? noc;
  static String? ownerSerialNo;

  static int? registrationYear;
  static String? bodyType;
  static String? transmissionType;
  static String? ownerType;
  static String? color;
  static int? kmsDriven = 13546;
  static String? description;
  static String? mileage;
  static String? maxPower;
  static String? maxTorque;
  static String? inspectionReport;
  static int inspectionScore = 4;

  @override
  State<BasicDocumentDetails> createState() => _BasicDocumentDetailsState();
}

class _BasicDocumentDetailsState extends State<BasicDocumentDetails> {
  @override
  void initState() {
    Provider.of<UploadBasicDetailsService>(context, listen: false)
        .getFeatures();
    // TODO: implement initState
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String thumbnail = context.watch<UploadImagesService>().thumbnailImagePath;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Document Details",
                style: AppFonts.w700black20,
              ),
              const SizedBox(
                height: 20,
              ),
              // CustomTextField(
              //     title: "Appointment ID *",
              //     controller: BasicDocumentDetails.controller,
              //     keyboardType: TextInputType.name,
              //     maxLength: 50,
              //     onChanged: (value) {
              //       BasicDocumentDetails.appointmentId = value;
              //     },
              //     validator: true),
              CustomTextField(
                  title: "Inspector Name ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.name,
                  maxLength: 25,
                  onChanged: (value) {
                    BasicDocumentDetails.inspectorName = value;
                  },
                  validator: true),
              CustomTextField(
                  title: "Customer Contact Number ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  onChanged: (value) {
                    BasicDocumentDetails.customerContactNumber = value;
                  },
                  validator: true),

              CustomTextField(
                  title: "Customer Expected Price ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  onChanged: (value) {
                    BasicDocumentDetails.customerExpectedPrice =
                        int.parse(value);
                  },
                  validator: true),

              ///
              ///
              ///
              CustomTextField(
                  title: "City ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  onChanged: (value) {
                    BasicDocumentDetails.city = value;
                  },
                  validator: true),

              ///
              ///
              ///

              CustomDropDown(
                  title: "Registration Type ",
                  onChanged: (value) {
                    BasicDocumentDetails.registerationType = value;
                  },
                  dropdownItems: const ["Private", "Commercial"]),
              CustomTextField(
                  title: "Registeration Number ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.name,
                  maxLength: 15,
                  onChanged: (value) {
                    BasicDocumentDetails.registerationNumber = value;
                  },
                  validator: true),
              CustomDropDown(
                  title: "RC Availability ",
                  onChanged: (value) {
                    BasicDocumentDetails.rcAvailability = value;
                  },
                  dropdownItems: const [
                    "Original",
                    "Photocopy",
                    "Lost",
                    "Lost with photocopy",
                    "Duplicate",
                  ]),
              UploadBasicImages(
                cameraFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageCamera(imageType: "rc", context: context);
                },
                galleryFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageGallery(imageType: "rc", context: context);
                },
                imageType: "rc",
                imagePath: context.watch<UploadBasicDetailsService>().rcImages,
                title: "RC Images",
              ),

              CustomDropDown(
                  title: "RC Condition ",
                  onChanged: (value) {
                    BasicDocumentDetails.rcCondition = value;
                  },
                  dropdownItems: const [
                    "Okay",
                    "Damaged",
                    "Faded",
                    "Not Applicable",
                  ]),
              DateTimeTextfield(
                validate: false,
                title: "Registeration Date",
                onChanged: (value) {
                  BasicDocumentDetails.registerationDate = value;
                },
              ),
              DateTimeTextfield(
                validate: true,
                title: "Fitness Upto",
                onChanged: (value) {
                  BasicDocumentDetails.fitnessUpto = value;
                },
              ),
              CustomDropDown(
                  title: "To be Scrapped ",
                  onChanged: (value) {
                    BasicDocumentDetails.toBeScrapped = value;
                  },
                  dropdownItems: const ["Yes", "No"]),

              ///
              ///
              ///
              CustomDropDown(
                  title: "Registration State ",
                  onChanged: (value) {
                    BasicDocumentDetails.registerationState = value;
                  },
                  dropdownItems: const ["West Bengal"]),

              ///
              /////
              ///
              ///
              RtoDropdown(selectRto: (value) {
                debugPrint(value);
                BasicDocumentDetails.registeredRtoVahan = value;
              }),
              //
              //
              //
              SelectBrandModelVarient(
                brandOnChanged: (value) {
                  BasicDocumentDetails.brand = value;
                  debugPrint(value);
                },
                modelOnChanged: (value) {
                  BasicDocumentDetails.model = value;
                  debugPrint(value);
                },
                varientOnChanged: (value) {
                  BasicDocumentDetails.varient = value;
                  debugPrint(value);
                },
              ),
              CustomTextField(
                  title: "Owner Serial No. ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.text,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.engineNumber = value;
                  },
                  validator: false),

              CustomTextField(
                  title: "Engine Number ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.text,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.engineNumber = value;
                  },
                  validator: false),
              CustomTextField(
                  title: "Chassis Number ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.text,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.chasisNumber = value;
                  },
                  validator: false),

              UploadBasicImages(
                imageType: "chassis",
                cameraFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageCamera(
                          imageType: "chassis", context: context);
                },
                galleryFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageGallery(
                          imageType: "chassis", context: context);
                },
                imagePath:
                    context.watch<UploadBasicDetailsService>().chassisImages,
                title: "Chassis Images",
              ),
              CustomTextField(
                  title: "Registered Owner Name ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.name,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.registeredOwnerName = value;
                  },
                  validator: false),

              CustomDropDown(
                  title: "Manufacturing Month",
                  onChanged: (value) {
                    BasicDocumentDetails.manufacturingMonth = value;
                  },
                  validate: true,
                  dropdownItems: const [
                    "Jan",
                    "Feb",
                    "Mar",
                    "Apr",
                    "May",
                    "Jun",
                    "Jul",
                    "Aug",
                    "Sep",
                    "Oct",
                    "Dec"
                  ]),

              CustomDropDown(
                  title: "Manufacturing Year",
                  onChanged: (value) {
                    BasicDocumentDetails.manufacturingYear = int.parse(value);
                  },
                  validate: true,
                  dropdownItems: getYears()),
              CustomDropDown(
                  title: "Fuel Type",
                  onChanged: (value) {
                    BasicDocumentDetails.fuelType = value;
                  },
                  validate: true,
                  dropdownItems: const ["Petrol", "Diesel", "Electric", "LPG"]),
              CustomTextField(
                  title: "Engine CC ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.engineCC = value;
                  },
                  validator: false),
              CustomDropDown(
                  title: "Hypothecation Details ",
                  onChanged: (value) {
                    BasicDocumentDetails.hypothecationDetails = value;
                  },
                  dropdownItems: const [
                    "Not Hypothecated",
                    "Loan Activity",
                    "Valid NOC Available",
                    "Not available",
                  ]),
              UploadBasicImages(
                imageType: "hypothecation",
                cameraFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageCamera(
                          imageType: "hypothecation", context: context);
                },
                galleryFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageGallery(
                          imageType: "hypothecation", context: context);
                },
                imagePath: context
                    .watch<UploadBasicDetailsService>()
                    .hypothecationImages,
                title: "Hypothecation Image",
              ),

              CustomTextField(
                  title: "Seating Capacity ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.seatingCapacity = int.parse(value);
                  },
                  validator: true),
              CustomDropDown(
                  title: "Mismatch in RC ",
                  onChanged: (value) {
                    BasicDocumentDetails.mismatchRC = value;
                  },
                  dropdownItems: const [
                    "No missmatch",
                    "Make",
                    "Model",
                    "Owner SL No",
                    "Fuel Type",
                    "Color"
                  ]),
              CustomDropDown(
                  title: "Road Tax ",
                  onChanged: (value) {
                    BasicDocumentDetails.roadTax = value;
                  },
                  dropdownItems: const [
                    "OTT",
                    "LTT",
                    "Limited Period",
                  ]),
              DateTimeTextfield(
                validate: false,
                title: "Road Tax Validity Upto ",
                onChanged: (value) {
                  BasicDocumentDetails.roadTaxValidity = value;
                },
              ),
              UploadBasicImages(
                imageType: "roadtax",
                galleryFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageGallery(
                          imageType: "roadtax", context: context);
                },
                cameraFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageCamera(
                          imageType: "roadtax", context: context);
                },
                imagePath:
                    context.watch<UploadBasicDetailsService>().roadTaxImages,
                title: "Road Tax Images",
              ),
              CustomDropDown(
                  title: "Insurance ",
                  onChanged: (value) {
                    BasicDocumentDetails.insurance = value;
                  },
                  dropdownItems: const [
                    "Third Party",
                    "Expired",
                    "Comprehensive",
                    "Zero Depriciation"
                  ]),
              UploadBasicImages(
                imageType: "insurance",
                galleryFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageGallery(
                          imageType: "insurance", context: context);
                },
                cameraFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageCamera(
                          imageType: "insurance", context: context);
                },
                imagePath:
                    context.watch<UploadBasicDetailsService>().insuranceImages,
                title: "Insurance Image",
              ),

              DateTimeTextfield(
                validate: false,
                title: "Insurance Validity ",
                onChanged: (value) {
                  BasicDocumentDetails.insuranceValidity = value;
                },
              ),
              CustomDropDown(
                  title: "No Claim Bonus ",
                  onChanged: (value) {
                    BasicDocumentDetails.noClaimBonus = value;
                  },
                  dropdownItems: const [
                    "10%",
                    "20%",
                    "30%",
                    "40%",
                    "50%",
                    "above 50%"
                  ]),
              CustomDropDown(
                  title: "Mismatch in Insurance ",
                  onChanged: (value) {
                    BasicDocumentDetails.misMatchInsurance = value;
                  },
                  dropdownItems: const [
                    "No Missmatch",
                    "Make/Model/Varient",
                    "Chassis Number",
                    "Engine Number",
                    "Registeration Number"
                  ]),
              CustomDropDown(
                  title: "Duplicate Key ",
                  onChanged: (value) {
                    BasicDocumentDetails.duplicateKey = value;
                  },
                  dropdownItems: const ["Yes", "No"]),
              UploadBasicImages(
                imageType: "duplicateKeyImage",
                cameraFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageCamera(
                          imageType: "duplicateKeyImage", context: context);
                },
                galleryFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageGallery(
                          imageType: "duplicateKeyImage", context: context);
                },
                imagePath: context
                    .watch<UploadBasicDetailsService>()
                    .duplicateKeyImages,
                title: "Duplicate Key",
              ),

              CustomDropDown(
                  title: "RTO NOC ",
                  onChanged: (value) {
                    BasicDocumentDetails.rtoNoc;
                  },
                  dropdownItems: const [
                    "Not Applicable",
                    "Issued",
                    "Expired",
                    "Missing"
                  ]),
              UploadBasicImages(
                imageType: "rtoNoc",
                galleryFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageGallery(
                          imageType: "rtoNoc", context: context);
                },
                cameraFunction: () {
                  Provider.of<UploadBasicDetailsService>(context, listen: false)
                      .selectImageCamera(imageType: "rtoNoc", context: context);
                },
                imagePath:
                    context.watch<UploadBasicDetailsService>().rtoNocImages,
                title: "RTO NOC Images",
              ),

              DateTimeTextfield(
                title: "RTO NOC Issue Date ",
                onChanged: (value) {
                  BasicDocumentDetails.rtoNocIssueDate = value;
                },
                validate: false,
              ),

              CustomDropDown(
                  title: "Registration Year ",
                  onChanged: (value) {
                    BasicDocumentDetails.registrationYear = int.parse(value);
                  },
                  validate: true,
                  dropdownItems: getYears()),

              FutureBuilder<List<BodyTypeModel>>(
                  future: GetBasicDetails.getBodyType(),
                  builder: (context, snapshot) {
                    List<String> data = snapshot.data != null
                        ? snapshot.data!.map((e) => e.bodyType).toList()
                        : [];
                    return CustomDropDown(
                        title: "Body Type ",
                        onChanged: (value) {
                          BasicDocumentDetails.bodyType = value;
                        },
                        validate: true,
                        dropdownItems: data);
                  }),
              CustomDropDown(
                  title: "Tansmission Type ",
                  onChanged: (value) {
                    BasicDocumentDetails.transmissionType = value;
                  },
                  validate: true,
                  dropdownItems: const ["Automatic", "Manual"]),
              FutureBuilder<List<OwnerTypeModel>>(
                  future: GetBasicDetails.getownership(),
                  builder: (context, snapshot) {
                    List<String> data = snapshot.data != null
                        ? snapshot.data!.map((e) => e.ownerType).toList()
                        : [];
                    return CustomDropDown(
                        title: "Owner Type ",
                        onChanged: (value) {
                          BasicDocumentDetails.ownerType = value;
                        },
                        validate: true,
                        dropdownItems: data);
                  }),
              SelectColor(
                selectColor: (value) {
                  BasicDocumentDetails.color = value;
                },
              ),
              CustomTextField(
                  title: "Kilometers Driven ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.kmsDriven = int.parse(value);
                  },
                  validator: true),

              MultiLineTextfield(
                  title: "Description",
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    BasicDocumentDetails.description = value;
                  },
                  validator: false),
              CustomTextField(
                  title: "Mileage ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.mileage = value;
                  },
                  validator: false),
              CustomTextField(
                  title: "Max Power ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.maxPower = value;
                  },
                  validator: false),
              CustomTextField(
                  title: "Max Torque ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 40,
                  onChanged: (value) {
                    BasicDocumentDetails.maxTorque = value;
                  },
                  validator: false),
              MultiLineTextfield(
                  title: "Inspection Report ",
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) {
                    BasicDocumentDetails.inspectionReport = value;
                  },
                  validator: true),
              CustomTextField(
                  title: "Inspection Score ",
                  controller: BasicDocumentDetails.controller,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  onChanged: (value) {
                    BasicDocumentDetails.inspectionScore = int.parse(value);
                  },
                  validator: true),
              Upload1Image(
                  title: "Thumbnail",
                  image:
                      context.watch<UploadImagesService>().thumbnailImagePath,
                  camerafunction: () {
                    Provider.of<UploadImagesService>(context, listen: false)
                        .carImagesCamera(context: context, type: "thumbnail");
                  },
                  galleryfunction: () {
                    Provider.of<UploadImagesService>(context, listen: false)
                        .pickCarImages(context: context, type: "thumbnail");
                  }),

              const CommentsOnBasicDetails(),
              const SizedBox(
                height: 20,
              ),
              const CarComfort(),
              const SizedBox(
                height: 20,
              ),
              const CarSafety(),
              const SizedBox(
                height: 20,
              ),
              const CarInterior(),
              const SizedBox(
                height: 20,
              ),
              const CarExterior(),
              const SizedBox(
                height: 20,
              ),
              const CarEntertainment(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 8),
          child: PrimaryButton(
              title: "Next",
              function: () {
                if (formKey.currentState!.validate()) {
                  if (thumbnail != "") {
                    Provider.of<UploadBasicDetailsService>(context,
                            listen: false)
                        .uploadData(
                      inspextorName: BasicDocumentDetails.inspectorName,
                      appointmentId: BasicDocumentDetails.appointmentId,
                      custContactNo: BasicDocumentDetails.customerContactNumber,
                      regType: BasicDocumentDetails.registerationType,
                      regNo: BasicDocumentDetails.registerationNumber,
                      bodyType: BasicDocumentDetails.bodyType,
                      brand: BasicDocumentDetails.brand,
                      carDescription: BasicDocumentDetails.description,
                      cc: BasicDocumentDetails.engineCC != null
                          ? int.parse(BasicDocumentDetails.engineCC!)
                          : null,
                      chassisNo: BasicDocumentDetails.chasisNumber,
                      city: BasicDocumentDetails.city,
                      color: BasicDocumentDetails.color,
                      duplicateKey: BasicDocumentDetails.duplicateKey,
                      engineNo: BasicDocumentDetails.engineNumber,
                      fittnessUpto: BasicDocumentDetails.fitnessUpto,
                      fuelType: BasicDocumentDetails.fuelType,
                      hypoDetails: BasicDocumentDetails.hypothecationDetails,
                      inspectionReport: BasicDocumentDetails.inspectionReport,
                      inspectionScore: BasicDocumentDetails.inspectionScore,
                      insurance: BasicDocumentDetails.insurance,
                      insuranceValidity: BasicDocumentDetails
                                  .insuranceValidity !=
                              null
                          ? int.parse(BasicDocumentDetails.insuranceValidity!)
                          : null,
                      kmsDriven: BasicDocumentDetails.kmsDriven,
                      manufacturingYear: BasicDocumentDetails.manufacturingYear,
                      maxPower: BasicDocumentDetails.maxPower,
                      maxTorque: BasicDocumentDetails.maxTorque,
                      mfgMonth: BasicDocumentDetails.manufacturingMonth,
                      mileage: BasicDocumentDetails.mileage,
                      missmatchInsurance:
                          BasicDocumentDetails.misMatchInsurance,
                      missmatchRC: BasicDocumentDetails.mismatchRC,
                      model: BasicDocumentDetails.model,
                      noClaimBonus: BasicDocumentDetails.noClaimBonus,
                      noc: BasicDocumentDetails.noc,
                      ownerSerialNo: BasicDocumentDetails.ownerSerialNo,
                      ownerType: BasicDocumentDetails.ownerType,
                      rcAvailablilty: BasicDocumentDetails.rcAvailability,
                      rcCondition: BasicDocumentDetails.rcCondition,
                      regDate: BasicDocumentDetails.registerationDate,
                      regOwnerName: BasicDocumentDetails.registeredOwnerName,
                      regState: BasicDocumentDetails.registerationState,
                      registrationYear: BasicDocumentDetails.registrationYear,
                      roadTax: BasicDocumentDetails.roadTax,
                      roadTaxValidity:
                          BasicDocumentDetails.roadTaxValidity != null
                              ? int.parse(BasicDocumentDetails.roadTaxValidity!)
                              : null,
                      rtoLocation: BasicDocumentDetails.registeredRtoVahan,
                      rtoNoc: BasicDocumentDetails.rtoNoc,
                      rtoNocIssueDate:
                          BasicDocumentDetails.rtoNocIssueDate != null
                              ? int.parse(BasicDocumentDetails.rtoNocIssueDate!)
                              : null,
                      seat: BasicDocumentDetails.seatingCapacity!,
                      tobeScraped: BasicDocumentDetails.toBeScrapped,
                      transmission: BasicDocumentDetails.transmissionType,
                      variant: BasicDocumentDetails.varient,
                      carId: widget.vehicleId,
                      customerExpectedPrice:
                          BasicDocumentDetails.customerExpectedPrice,
                      thumbnail: thumbnail,
                    );
                    Provider.of<VehicleInspectionService>(context,
                            listen: false)
                        .increaseIndex();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 2),
                        backgroundColor: Color(0xFF45C08D),
                        content: Text("Add thumbnail Image"),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 2),
                      backgroundColor: Color(0xFF45C08D),
                      content: Text("Upload all required data"),
                    ),
                  );
                }
              },
              borderColor: const Color(0xff161F31),
              backgroundColor: const Color(0xff161F31),
              textStyle: AppFonts.w500white14),
        ),
      ),
    );
  }

  List<String> getYears() {
    List<String> years = [];
    for (var i = 2000; i < 2025; i++) {
      years.add(i.toString());
    }

    return years;
  }
}
