import UIKit
/**
 GuideScreenViewController.swift
 
 This is the screen that is displayed after the splash screen when the user installs the app for the first time. This screen gives a brief detail about the application.
 
 - Author:
 Danish Khan
 
 - Copyright:
 Zapbuild Technologies Pvt Ltd
 
 - Date:
 17/01/20
 
 - Version:
 1.0
 */

class GuideScreenViewController: BaseViewController {
    //MARK:-  Outlets
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var guideCollectionView: UICollectionView!
    @IBOutlet private weak var skipButton: UIButton!
    
    //MARK:-  variables
    private var  displayedScreenIndex:Int?
    private var guideScreenDataModel: [GuideScreenData]!
    private struct GuideScreenData {
        var title:String?
        var description:String?
        var image:UIImage?
    }
    
    lazy private var window: UIWindow? = {
        return RootScreenUtility.window(for: view)
    }()
    
    //MARK:-  View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setGuideScreenData()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = guideScreenDataModel.count
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pageControl.currentPage = 0
        displayedScreenIndex =  pageControl.currentPage
    }
    
    
    //MARK:- Private Functions
    private func setGuideScreenData() {
        guideScreenDataModel = [
            GuideScreenData(title: "Customized Media Training", description:  "Prest is a customizable media training platform that helps athletes be as prepared in front of the camera, as they are on the field.", image:#imageLiteral(resourceName: "guide1")),
            GuideScreenData(title: "Media Training On Your Schedule", description:  "Each training module can be individualized to fit any program or situation and completed on your own schedule with access to additional practice modules.", image: #imageLiteral(resourceName: "g2")),
            GuideScreenData(title: "Individualized Feedback", description:  "Each module will receive individualized feedback to help athletes learn to tell their own story and become more confident representing their team and community.", image: #imageLiteral(resourceName: "g3"))
        ]
    }
    
    //MARK:-  IBActions
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        // At last page
        if displayedScreenIndex == guideScreenDataModel.count - 1 {
            UserDefaultManager.sharedManager.setGuideScreen(true)
            RootScreenUtility.setRootScreen(window: window)
            return
        }
        let indexPath = IndexPath(row: displayedScreenIndex! + 1, section: 0);
        guideCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        displayedScreenIndex! += 1
        pageControl.currentPage  = displayedScreenIndex!
    }
    
    
    @IBAction private func backButtonTapped(_ sender: UIButton) {
        let indexPath = IndexPath(row: displayedScreenIndex! - 1, section: 0);
        guideCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        displayedScreenIndex? -= 1
        pageControl.currentPage  = displayedScreenIndex!
    }
    
    @IBAction private func skipButtonTapped(_ sender: UIButton) {
        UserDefaultManager.sharedManager.setGuideScreen(true)
        RootScreenUtility.setRootScreen(window: window)
    }
}


//MARK:-  UICollectionViewDataSource
extension GuideScreenViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return guideScreenDataModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = guideCollectionView.dequeueReusableCell(withReuseIdentifier: "GuideCollectionViewCell", for: indexPath) as! GuideCollectionViewCell
        let data = guideScreenDataModel[indexPath.row]
        cell.setCellData(image: data.image!, title: data.title!, cellDescription: data.description!)
        return cell
    }
    
    
}
//MARK:-  Scroll View Delegates
extension GuideScreenViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        displayedScreenIndex = pageControl.currentPage
        if displayedScreenIndex == guideScreenDataModel.count - 1 {
            skipButton.setTitle("Get Started", for: .normal)
        }else{
            skipButton.setTitle("Skip", for: .normal)
        }
    }
}

//MARK:-  UICollectionViewDelegateFlowLayout
extension GuideScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

