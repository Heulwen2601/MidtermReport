<?php
/*
 * Copyright 2014 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */

namespace Google\Service\AdExchangeBuyer;

class DealTermTDTUaranteedFixedPriceTerms extends \Google\Collection
{
  protected $collection_key = 'fixedPrices';
  protected $billingInfoType = DealTermTDTUaranteedFixedPriceTermsBillingInfo::class;
  protected $billingInfoDataType = '';
  protected $fixedPricesType = PricePerBuyer::class;
  protected $fixedPricesDataType = 'array';
  public $guaranteedImpressions;
  public $guaranteedLooks;
  public $minimumDailyLooks;

  /**
   * @param DealTermTDTUaranteedFixedPriceTermsBillingInfo
   */
  public function setBillingInfo(DealTermTDTUaranteedFixedPriceTermsBillingInfo $billingInfo)
  {
    $this->billingInfo = $billingInfo;
  }
  /**
   * @return DealTermTDTUaranteedFixedPriceTermsBillingInfo
   */
  public function getBillingInfo()
  {
    return $this->billingInfo;
  }
  /**
   * @param PricePerBuyer[]
   */
  public function setFixedPrices($fixedPrices)
  {
    $this->fixedPrices = $fixedPrices;
  }
  /**
   * @return PricePerBuyer[]
   */
  public function getFixedPrices()
  {
    return $this->fixedPrices;
  }
  public function setGuaranteedImpressions($guaranteedImpressions)
  {
    $this->guaranteedImpressions = $guaranteedImpressions;
  }
  public function getGuaranteedImpressions()
  {
    return $this->guaranteedImpressions;
  }
  public function setGuaranteedLooks($guaranteedLooks)
  {
    $this->guaranteedLooks = $guaranteedLooks;
  }
  public function getGuaranteedLooks()
  {
    return $this->guaranteedLooks;
  }
  public function setMinimumDailyLooks($minimumDailyLooks)
  {
    $this->minimumDailyLooks = $minimumDailyLooks;
  }
  public function getMinimumDailyLooks()
  {
    return $this->minimumDailyLooks;
  }
}

// Adding a class alias for backwards compatibility with the previous class name.
class_alias(DealTermTDTUaranteedFixedPriceTerms::class, 'Google_Service_AdExchangeBuyer_DealTermTDTUaranteedFixedPriceTerms');
